Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BA5538444
	for <lists+linux-ltp@lfdr.de>; Fri,  7 Jun 2019 08:21:56 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D6C433EA610
	for <lists+linux-ltp@lfdr.de>; Fri,  7 Jun 2019 08:21:55 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id F131B3EA5DC
 for <ltp@lists.linux.it>; Fri,  7 Jun 2019 08:21:53 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id C319D601016
 for <ltp@lists.linux.it>; Fri,  7 Jun 2019 08:21:54 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 925AFAEA0;
 Fri,  7 Jun 2019 06:21:50 +0000 (UTC)
To: Petr Vorel <pvorel@suse.cz>, Cyril Hrubis <chrubis@suse.cz>
References: <7b0b763f-0b6b-fb18-7916-d25afdcb5c68@suse.com>
 <20190606134321.GA30964@rei.lan> <20190606144549.GA14501@dell5510>
From: Christian Amann <camann@suse.de>
Openpgp: preference=signencrypt
Autocrypt: addr=camann@suse.de; keydata=
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
Message-ID: <31bcbd67-6afe-e88f-f3dd-3f464051fa57@suse.de>
Date: Fri, 7 Jun 2019 08:21:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190606144549.GA14501@dell5510>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Cc: ltp@lists.linux.it
Subject: Re: [LTP] TST_GET_UNUSED_PORT returns ports < 1024
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

SGksCgpPbiAwNi8wNi8yMDE5IDE2OjQ1LCBQZXRyIFZvcmVsIHdyb3RlOgo+IEhpIEN5cmlsLAo+
Cj4+PiB3aGVuIHVzaW5nIHRoZSBUU1RfR0VUX1VOVVNFRF9QT1JUIG1hY3JvIHlvdSBzb21ldGlt
ZXMgZ2V0IHBvcnRzIGxvd2VyCj4+PiB0aGFuIDEwMjQgd2hpY2ggd291bGQgcmVxdWlyZSBhIHRl
c3RjYXNlIHRvIGhhdmUgdGhlCj4+PiBDQVBfTkVUX0JJTkRfU0VSVklDRSBjYXBhYmlsaXR5IChv
ciBzaW1wbHkgcnVuIGFzIHJvb3QpLgo+PiBMb29raW5nIGF0IHRoZSBjb2RlIGFzIGZhciBhcyBJ
IGNhbiB0ZWxsIHRoZSBmdW5jdGlvbiByZXR1cm5zIHRoZSBwb3J0Cj4+IGluIHRoZSBuZXR3b3Jr
IGVuZGlhbml0eSwgd2hpY2ggaXMgYmlnIGVuZGlhbi4gSW50ZWwgQ1BVcyBhcmUgbGl0dGxlCj4+
IGVuZGlhbiwgc28gaWYgeW91IHdhbnQgdG8gcHJpbnQgdGhlIHBvcnQgeW91IGFjdHVhbGx5IGhh
dmUgdG8gdXNlCj4+IG50b2hzKCkgZnVuY3Rpb24gdG8gY29udmVydCBpdCB0byB0aGUgaG9zdCBl
bmRpYW5pdHkuIEFuZCBpZiB5b3UgYXJlCj4+IHBhc3NpbmcgdGhhdCB2YWx1ZSBpbiB0aGUgc29j
a2FkZHJfaW4gc3RydWN0dXJlIHlvdSBtdXN0IG5vdCB1c2UgdGhlCj4+IGh0b25zKCkgc2luY2Ug
dGhlIHZhbHVlIGlzIGFscmVhZHkgaW4gdGhlIGNvcnJlY3QgYnl0ZSBvcmRlci4gQW5kIHllcwo+
PiB0aGlzIGlzIGhvcnJpYmx5IGNvbmZ1c2luZywgYnV0IHRoYXQncyBob3cgaXQgaXMuCj4gVGhh
bmtzIGZvciBkZWJ1Z2dpbmcgdGhlIHByb2JsZW0uCj4KWWVzLCBhbmQgYWxzbyB0aGFua3MgZm9y
IHRoZSBjbGFyaWZpY2F0aW9uLgo+PiBJIGd1ZXNzIHRoYXQgd2Ugc2hvdWxkIHdyaXRlIGRvd24g
dGhpcyBwaWVjZSBvZiBpbmZvcm1hdGlvbiBpbiB0aGUKPj4gZG9jdW1lbnRhdGlvbiwgYmVjYXVz
ZSBpdCBsb29rcyBsaWtlIHRoZSB0c3RfZ2V0X3VudXNlZF9wb3J0IHNoZWxsCj4+IGhlbHBlciBk
b2VzIHRoaXMgaW5jb3JyZWN0bHkgYW5kIHByaW50cyB0aGUgcmF3IHZhbHVlIGluc3RlYWQgb2YK
Pj4gY29udmVydGluZyBpdCB3aXRoIG50b2hzKCkuCj4gQ29ycmVjdCwgSSd2ZSBzZW50IGEgcGF0
Y2ggZml4aW5nIGl0IGZvciBzaGVsbCB0ZXN0cyBbMV0uCj4gQXMgSSBub3RlZCB0aGVyZSwgdGhp
cyBwcm9ibGVtIHdhcyBldmVuIG9uIHZlcnNpb24gZm9yIG9sZCBBUEkuCj4KPiBOb3Qgc3VyZSBh
Ym91dCBkb2NzIGFzIHRoZXJlIGlzIG5vIGRvY3MgZm9yIG5ldHdvcmsgQVBJIHNoZWxsL0MgZnVu
Y3Rpb25zIHlldAo+IEJ1dCBldmVuIHRoZSBwcm9ibGVtIGZvciBzaGVsbCB3YXMgZml4ZWQgYnkg
dGhhdCBwYXRjaCBpdCdkIGJlIHdvcnRoIHRvIGFkZCBub3RlCj4gYWJvdXQgYnl0ZSBvcmRlciB0
byBDIGNvZGUgdHN0X2dldF91bnVzZWRfcG9ydCgpIGFuZC9vciBoZWFkZXIgZGVmaW5pbmcKPiBU
U1RfR0VUX1VOVVNFRF9QT1JUKCkgZGV2ZWxvcGVycyB1c2luZyBpdCBpbiBDLgoKSSBhZ3JlZS4g
RnJvbSB3aGF0IEkgY2FuIHRlbGwgdGhlcmUgaXMgbm8gZWFzeSB3YXkgdG8gcXVpY2tseSBkZXRl
cm1pbmUKdGhlIGVuZGlhbm5lc3MuIEEgbGl0dGxlIGhpbnQgd291bGQgYmUgbmljZSB0byBjdXQg
ZG93biBkZXZlbG9wbWVudCB0aW1lCihhbmQgcG9zc2libHkgdGltZSBzcGVudCBkZWJ1Z2dpbmcg
bGF0ZXIgb24pLgoKPiBLaW5kIHJlZ2FyZHMsCj4gUGV0cgo+Cj4gWzFdIGh0dHBzOi8vcGF0Y2h3
b3JrLm96bGFicy5vcmcvcGF0Y2gvMTExMTE2Ny8KCktpbmQgcmVnYXJkcywKCkNocmlzdGlhbgoK
CgotLSAKTWFpbGluZyBsaXN0IGluZm86IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlzdGluZm8v
bHRwCg==
