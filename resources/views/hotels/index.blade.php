<x-app-layout>

    <div class="py-14 px-1 md:px-6 2xl:px-20 2xl:container 2xl:mx-auto">
        <form action="{{route('hotels.index')}}" method="GET">
            <label for="select">Фильтрация по удобствам: </label>
            <select name="hotels-filter" id="select">
                <option value="">Без фильтра</option>
                @foreach ($facilities as $facility)
                    @if($facility->id === $facilityId)
                        <option value="{{ $facility->id }}" selected>{{$facility->title}}</option>
                    @else
                        <option value="{{ $facility->id }}">{{$facility->title}}</option>
                        @endif
                @endforeach
            </select>
            <label for="min-price">Цена за ночь до: </label>
            <input name="min-price" type="number" placeholder="цена" value="{{$price}}">
            <x-the-button >{{ __('Поиск') }}</x-the-button>
        </form>
    </div>

    <div class="py-14 px-4 md:px-6 2xl:px-20 2xl:container 2xl:mx-auto">
        <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
            @foreach($hotels as $hotel)
                @if(!empty($facilityId))
                    @if (!empty($price))
                        @if($hotel->rooms->min('price') <= $price && $hotel->facilities->contains($facilityId))
                            <x-hotels.hotel-card :hotel="$hotel"></x-hotels.hotel-card>
                            @php
                                $hotelsCount++;
                            @endphp
                        @endif
                    @elseif($hotel->facilities->contains($facilityId))
                        <x-hotels.hotel-card :hotel="$hotel"></x-hotels.hotel-card>
                        @php
                            $hotelsCount++;
                        @endphp
                    @endif
                @elseif(!empty($price))
                    @if($hotel->rooms->min('price') <= $price)
                        <x-hotels.hotel-card :hotel="$hotel"></x-hotels.hotel-card>
                        @php
                            $hotelsCount++;
                        @endphp
                    @endif
                @else
                    <x-hotels.hotel-card :hotel="$hotel"></x-hotels.hotel-card>
                    @php
                        $hotelsCount++;
                    @endphp
                @endif
            @endforeach
            @if($hotelsCount == 0)
                <h1>Отелей по заданным критериям не существует в нашем каталоге</h1>
            @endif
        </div>
    </div>
</x-app-layout>
