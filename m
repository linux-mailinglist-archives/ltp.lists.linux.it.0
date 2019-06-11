Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id E78D73C9C1
	for <lists+linux-ltp@lfdr.de>; Tue, 11 Jun 2019 13:12:06 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id AD1603EAECA
	for <lists+linux-ltp@lfdr.de>; Tue, 11 Jun 2019 13:12:06 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 9C2DC3EAC0E
 for <ltp@lists.linux.it>; Tue, 11 Jun 2019 13:12:04 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id B83F8600951
 for <ltp@lists.linux.it>; Tue, 11 Jun 2019 13:12:02 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id DFC3EAE5A
 for <ltp@lists.linux.it>; Tue, 11 Jun 2019 11:12:01 +0000 (UTC)
To: Cyril Hrubis <chrubis@suse.cz>
References: <20190604114702.28255-1-camann@suse.com>
 <20190606131015.GA12020@rei>
From: Christian Amann <camann@suse.com>
Openpgp: preference=signencrypt
Autocrypt: addr=camann@suse.com; keydata=
 xsFNBFuOSGcBEAC8nPcXDp1KLSM/2OcnwHj4Oj7MBKt9BwxA3ODtxP3vvKghs5x+CFUs9ZLk
 f3fC1LOWWL5peDV9cO3mRT1idNM+ZZqc/puH2DGLXMpGFU/l1xEprIQSGOxngFWquoBR6Q+Q
 eyLI+iQIqPt6D3YjcOFn/86n/mew7Hi6wMSZnSY3OF+sjLkAVBnWUgS7AzS3Z5QRrFhqiAu1
 nBVP4r+PL12p1GOf/E9Eqcm5LdYifVpjE6c783za3uMEXreW0Wt2dsmzOMa86fBJw9cQnEVH
 wkU/6Sa8WOo6EkLm5/UQYCdexhUoHyhT/AsViLvlFVVz7oFHhQbapcBDaaMdiD7dIFWxh40i
 N7e+JFLUhucFGkP7/QfjZNj7ikwON4hxwr6D+WLQnj+zxZKHk3WQsK9GGoLLqAz0sd4t3L0b
 KkGDP/hALsK83N0errgF8krtGsjVdt7xQoNtngB30axVtCObw7QoU6jY2Q2yxaaHXw+PGM9H
 93Dr8h0snz/m15yz7bc86lEXREHaqced9O6DOv3DiMMcETBojYkohDgQf8HmOVu/SsFVoYnV
 FUYiuKr2eG4qyj7WIDADPGwVQPL+gSgRNvKRUwZ/IJLjee4GQbrg4lNoVuqo/6zXCvTphMsl
 nPQM93zpCaJZGXEDO9jjECH9TgJzglBgrI+meQOk/TqTVWuEDwARAQABzSpDaHJpc3RpYW4g
 QW1hbm4gPGNocmlzdGlhbi5hbWFubkBzdXNlLmNvbT7CwZQEEwEIAD4WIQRVlIS2Ei3u9WW3
 NIYte5iGyGyP7gUCW45IZwIbAwUJBaOagAULCQgHAgYVCgkICwIEFgIDAQIeAQIXgAAKCRAt
 e5iGyGyP7mKrD/9ST9Zz4TlvuuynEfp8qh8v3wUVnjRgCMGvz8IPfcEVwbwfAKN65TDOV3Xr
 DIa8pU5g4HrNdtVZUtEZhDtWastBT2+jhdHpPcbCge51C6yzHxQxdHKF8oMxy4zv+d3zJ1+M
 PBnoefonYKx9T+NBHrEl8q/yJs217KskiTJMTlmvn4NXqeTVzmf8J+kvZnjjhyvNMAbfbfFB
 3y1O8vQyDcfEGfcOjMk3b4XOqlnH3CNsrqBmave6ohpXv3bTbcGuiVJPNtW+x8reWIzcswzd
 4fd5Ern3LsD36MTIYvm7JO4ZkkvwxMmTndujly65tHAImegCFMDdylHrHilzB0gyTFzOMyJy
 FMf/p4lBNG5WgwqOyH3Lp49Ff3XS0Dm/mmurGktpNYdiCu5bxPVOKoVFp9Y8bDCTBQ3qjWGb
 YuOKKp+dZETff1talFuPJrfrg+G1X87NuEhpNVwJkpF1UM/oTGnkSni9uU4D04152Y/9ei1d
 jbu76krliGPpruX25h+lH2Idy1MoVpAJOZialb9QOvIKBUCmtXLLRs6MyDt7fmH7srEhaFbi
 JWsPnSu0HN/WErzNczD0HDVZYMNvHXGD33HhKfLxrWfuFutbUvkdEzSWrZt0+KBM7wmTSJYU
 oxohnffjOD3Nq6RunkQ2xW1x5M42t3euHEvdyqwm8qguMng83M7BTQRbjkhnARAAwon1pJAU
 /TqHPJkdA4DPyiUcBhQgbgmSW4M7+SZNQp9ymAZ/c9voUa8FaR+NTFM2y5ASXJrfPvlvTODD
 RXcHFa5BIFuuyVNCOSozvGdmlRWCPwMIjI0szkbsa/MtTG3slQnMvv2SiAWgf7ySZbWGau4N
 WnEvweeaxWC4ao36iMI+7Ic8yeB4gXsENIm3XbcrCbjJWkdgzfvARcJvcNq+OCMRT2gYaS0X
 HyjlJEIcH9hjdtl5mVkN4fUmof+oAk1xKQjCwDbyCLWQZqFSXE/VjO/4rvOONLkQvkcxb6WC
 1cf3FrU7f9mjS/zTG2giuYdUzq2ZP/aw8a+b9mrO5lHTmbSQXgSLfVBXG6bH3IkF9NbOk/gm
 avFey08ek60nMyDWInlOQsSwUC4GF7v9jURRCJB5Kch9OvyPkcUiKiU+4szRBFulDu9qcToB
 r7Uh3EH1hlWyxiqB14ZCqUWuV22sMtD+hkBkO9J/qyjeUwRI+JxqejtiDxFSfhMAIv6c9LLG
 DjluSTQOeD41h1cedl8I7gSU79haQAhUl2RgvQzLCq1n4DOKY2kqhY21zjHVP+dphsNlLtsI
 S+s8XD2O/RJ/6Wm46hqK62Z9W0oBPwOVXHZsSRwWqvquErqO3cZDr9uiUphv5k2Zxn1oxIUd
 dtbe6ZuBzKbU+wNuP4my0Zw1DeEAEQEAAcLBewQYAQgAJhYhBFWUhLYSLe71Zbc0hi17mIbI
 bI/uBQJbjkhnAhsMBQkFo5qAAAoJEC17mIbIbI/uIjkP+KwffCD3I93CT4FFKcdKdE3IyjV7
 dNm9Fr0jIL/5c3eqLzaaTKtZtXbk3pkw2XPHcRH1kOPxeG7OB5HlrJTMsWSd2+1r8ULJFtAg
 t7v/mN/OA2Lk2IBifI4VopD2KU6bOtd9hUNSB35X43IEGavIm2w+UqBrqwk/Q6sM4rJWo7rs
 mhB8F58MjtTu+BwNH3uLX/e/QqKBzuLogulMF33ZmxjQjmZCHY+dBYxnl9cHLpqSZRZjao3j
 TsKEgUeririuGROzP2H6AhWjaNpbAYpo4VQH3c8iyczLg9Goh6mB9J+FitFvBYgJ28GdY5yi
 +fB6c2uIXf++Kmq8pk6mz9ZLcTBpUq2rDEpfDEbl38PYXhRvUYKxmoOQrH2dGOE8DmbBnMmT
 O0wec8zfTHezydNLYPZLp7KFYT8g4zR4TKFFsum1w/EzKv+IlJpuIsGT+54AMXNhWa+CtvR6
 Nb55zWt/WfIQTqdTcnEzLMOq3EsVkuSYlnbhhbJURQ2O5K5717+Z8gQcapqnxx6mSVAyT87d
 KB/SbYfaGYsgS6nTcjC38RJkFxMFTMfmoZk1wzFzjFrAbvRV3xid/JaLmYiFoZQSRmCGatnv
 bvlAWQdqs4uj/5fssZEEcc5J5SRLX7n87PCacZvdgeUjNILuIiAHr/Xa8LPAqx9zMhHfMXMu
 du2mz1Q=
Message-ID: <9b5fa0d0-93a4-b94a-179a-ad65351082b7@suse.com>
Date: Tue, 11 Jun 2019 13:12:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190606131015.GA12020@rei>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Cc: ltp@lists.linux.it
Subject: Re: [LTP] [PATCH v2 2/4] syscalls/pidfd_send_signal01
X-BeenThere: ltp@lists.linux.it
X-Mailman-Version: 2.1.18
Precedence: list
List-Id: Linux Test Project <ltp.lists.linux.it>
List-Unsubscribe: <https://lists.linux.it/options/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=unsubscribe>
List-Archive: <http://lists.linux.it/pipermail/ltp/>
List-Post: <mailto:ltp@lists.linux.it>
List-Help: <mailto:ltp-request@lists.linux.it?subject=help>
List-Subscribe: <https://lists.linux.it/listinfo/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGksCgpObywgdGhlICouaW4gZmlsZSBjaGFuZ2VzIGFyZSBpbiBhIHNlcGFyYXRlIGNvbW1pdCBb
MV0uIEkgZGlkbid0IGluY2x1ZGUKaXQgaW4gdmVyc2lvbiAyIG9mIHRoaXMgcGF0Y2ggYmVjYXVz
ZSBpdCBkaWRuJ3QgY2hhbmdlLgoKU29ycnkgZm9yIHRoYXQsIEkgd2lsbCBpbmNsdWRlIHRob3Nl
IGNvbW1pdHMgaW4gdGhlIGZ1dHVyZS4KCktpbmQgcmVnYXJkcywKCkNocmlzdGlhbgoKWzFdIGh0
dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcGF0Y2gvMTA5OTk2Ni8KCgpPbiAwNi8wNi8yMDE5
IDE1OjEwLCBDeXJpbCBIcnViaXMgd3JvdGU6Cj4gSGkhCj4gV2hlbiBJIGF0dGVtcHR5IHRvIGNv
bXBpbGUgdGhpcyBjb2RlIEkgZ2V0Ogo+Cj4gSW4gZmlsZSBpbmNsdWRlZCBmcm9tIHBpZGZkX3Nl
bmRfc2lnbmFsLmg6MTE6MCwKPiAgICAgICAgICAgICAgICAgIGZyb20gcGlkZmRfc2VuZF9zaWdu
YWwwMS5jOjE3Ogo+IHBpZGZkX3NlbmRfc2lnbmFsLmg6IEluIGZ1bmN0aW9uICdjaGVja19zeXNj
YWxsX3N1cHBvcnQnOgo+IHBpZGZkX3NlbmRfc2lnbmFsLmg6MTY6MTQ6IGVycm9yOiAnX19OUl9w
aWRmZF9zZW5kX3NpZ25hbCcgdW5kZWNsYXJlZCAoZmlyc3QgdXNlIGluIHRoaXMgZnVuY3Rpb24p
OyBkaWQgeW91IG1lYW4gJ19fTlJfcGVyZl9ldmVudF9vcGVuJz8KPiAgIHRzdF9zeXNjYWxsKF9f
TlJfcGlkZmRfc2VuZF9zaWduYWwpOwo+ICAgICAgICAgICAgICAgXgo+IC4uLy4uLy4uLy4uL2lu
Y2x1ZGUvbGFwaS9zeXNjYWxscy5oOjM5OjY6IG5vdGU6IGluIGRlZmluaXRpb24gb2YgbWFjcm8g
J3RzdF9zeXNjYWxsJwo+ICAgaWYgKE5SID09IF9fTFRQX19OUl9JTlZBTElEX1NZU0NBTEwpIHsg
XAo+ICAgICAgIF5+Cj4gcGlkZmRfc2VuZF9zaWduYWwuaDoxNjoxNDogbm90ZTogZWFjaCB1bmRl
Y2xhcmVkIGlkZW50aWZpZXIgaXMgcmVwb3J0ZWQgb25seSBvbmNlIGZvciBlYWNoIGZ1bmN0aW9u
IGl0IGFwcGVhcnMgaW4KPiAgIHRzdF9zeXNjYWxsKF9fTlJfcGlkZmRfc2VuZF9zaWduYWwpOwo+
ICAgICAgICAgICAgICAgXgo+IC4uLy4uLy4uLy4uL2luY2x1ZGUvbGFwaS9zeXNjYWxscy5oOjM5
OjY6IG5vdGU6IGluIGRlZmluaXRpb24gb2YgbWFjcm8gJ3RzdF9zeXNjYWxsJwo+ICAgaWYgKE5S
ID09IF9fTFRQX19OUl9JTlZBTElEX1NZU0NBTEwpIHsgXAo+ICAgICAgIF5+Cj4gcGlkZmRfc2Vu
ZF9zaWduYWwuaDogSW4gZnVuY3Rpb24gJ3BpZGZkX3NlbmRfc2lnbmFsJzoKPiBwaWRmZF9zZW5k
X3NpZ25hbC5oOjIzOjIxOiBlcnJvcjogJ19fTlJfcGlkZmRfc2VuZF9zaWduYWwnIHVuZGVjbGFy
ZWQgKGZpcnN0IHVzZSBpbiB0aGlzIGZ1bmN0aW9uKTsgZGlkIHlvdSBtZWFuICdwaWRmZF9zZW5k
X3NpZ25hbCc/Cj4gICByZXR1cm4gdHN0X3N5c2NhbGwoX19OUl9waWRmZF9zZW5kX3NpZ25hbCwg
cGlkZmQsIHNpZywgaW5mbywgZmxhZ3MpOwo+ICAgICAgICAgICAgICAgICAgICAgIF4KPiAuLi8u
Li8uLi8uLi9pbmNsdWRlL2xhcGkvc3lzY2FsbHMuaDozOTo2OiBub3RlOiBpbiBkZWZpbml0aW9u
IG9mIG1hY3JvICd0c3Rfc3lzY2FsbCcKPiAgIGlmIChOUiA9PSBfX0xUUF9fTlJfSU5WQUxJRF9T
WVNDQUxMKSB7IFwKPiAgICAgICBefgo+IG1ha2U6ICoqKiBbPGJ1aWx0aW4+OiBwaWRmZF9zZW5k
X3NpZ25hbDAxXSBFcnJvciAxCj4KPgo+IEhhdmUgeW91IGZvcmdvdHRlbiB0byBnaXQgYWRkIHRo
ZSAqLmluIGZpbGVzIHdpdGggc3lzY2FsbCBudW1iZXJzPwo+CgotLSAKTWFpbGluZyBsaXN0IGlu
Zm86IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlzdGluZm8vbHRwCg==
