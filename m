Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D10E3926FAC
	for <lists+linux-ltp@lfdr.de>; Thu,  4 Jul 2024 08:36:44 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 764433D111F
	for <lists+linux-ltp@lfdr.de>; Thu,  4 Jul 2024 08:36:44 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id A8A093D0878
 for <ltp@lists.linux.it>; Thu,  4 Jul 2024 08:36:42 +0200 (CEST)
Authentication-Results: in-2.smtp.seeweb.it; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=170.10.129.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=liwan@redhat.com;
 receiver=lists.linux.it)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 3AEE0601EA5
 for <ltp@lists.linux.it>; Thu,  4 Jul 2024 08:36:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1720074999;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3QzD9p4q/ns54S36zJUI5IvIU/tFD09QxR6bV2g8duM=;
 b=SdIZKpNyuRSTbmxiv+/RkWlaoYAB9S8SNLXtQEBKLtXtGREIJNWMMSC07Naeyn7fissyIe
 ZTnyts7V0cf87vSzqGYRYJcLCYrwHTl/8E4/MRNsDKcQpooX1w6BpTpxrHUB/PnwqxgNm5
 s1lS59zOBojGVmbT01yOu2QFu3qAVag=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-597-UjKqb4ARO2WEACYijUsObA-1; Thu, 04 Jul 2024 02:36:37 -0400
X-MC-Unique: UjKqb4ARO2WEACYijUsObA-1
Received: by mail-pj1-f71.google.com with SMTP id
 98e67ed59e1d1-2c7430b3c4bso361787a91.1
 for <ltp@lists.linux.it>; Wed, 03 Jul 2024 23:36:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720074996; x=1720679796;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3QzD9p4q/ns54S36zJUI5IvIU/tFD09QxR6bV2g8duM=;
 b=EvwRnyV09Ahw8c1KOApr1BF1vhRgexKjfme+NQAyCrMrl5Nl5HKeBav9ESefLgPQax
 0P5Hh29cQ9iCaD9EiCf4vcCgutMewoeWtXQRN/caHO8SzZ++M0sHLkIx1eIIyZN1x0ir
 ZPyXtq30zVZKh4w3BPb2de7eSWLTLqF4lNR5HuDv6Ls59YSYjsSjKLYNsZlHM3uBW8hX
 Fi65Ffnchr+W9ayVaVj5rjtjsn5H/vsPFQ5Eyxt8Y3bCRJZWkTKK5v3HWzByh6X/JhrK
 0sY7lHcStOBo2HieznFxH13ePgchmNtv85Ss9knzx2rrEgTvJXspiSqAncJ8/I3nJJz1
 UbwA==
X-Gm-Message-State: AOJu0YzGuTlVqT6zU/nVNVmgyGU2BsqBehHoHdOFftKJ4EuMk/Ex6fYm
 vzrr7uxlTfP5BgH6gKwNinhtukUillXgdjLOnA0m2ogaCOFUIYP9X98DRLWQrOOesJG5rTNJqmW
 UEnD6sJU/ekRJ+/NmZ1HME7/Nc6cerrt2SN0ojqBLk2/wiWvxUVNKsTcFk14R27vmaqs6sVhtQT
 DDFH5flGBDRdI58D/jeGJD3xQ=
X-Received: by 2002:a17:90b:3757:b0:2c3:40b6:293b with SMTP id
 98e67ed59e1d1-2c99c6b380fmr561399a91.39.1720074996467; 
 Wed, 03 Jul 2024 23:36:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH1TaxXJgs1cbYtdLgtDqP7S0gwNBDoTBL9Q1v66NaKWpkiIoTx1M3tGC2Ms4t4njyNO+3ixSHXGq40uNGATHg=
X-Received: by 2002:a17:90b:3757:b0:2c3:40b6:293b with SMTP id
 98e67ed59e1d1-2c99c6b380fmr561390a91.39.1720074996086; Wed, 03 Jul 2024
 23:36:36 -0700 (PDT)
MIME-Version: 1.0
References: <20240702-stat04-v1-0-e27d9953210d@suse.com>
 <20240702-stat04-v1-3-e27d9953210d@suse.com>
In-Reply-To: <20240702-stat04-v1-3-e27d9953210d@suse.com>
From: Li Wang <liwang@redhat.com>
Date: Thu, 4 Jul 2024 14:36:24 +0800
Message-ID: <CAEemH2fM_X=VYUpkv3vrrjsWTW5KQvEerjBGggwESy=9xqHC4A@mail.gmail.com>
To: Andrea Cervesato <andrea.cervesato@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,DMARC_PASS,HTML_MESSAGE,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-2.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
Subject: Re: [LTP] [PATCH 3/5] Add lstat03 test
X-BeenThere: ltp@lists.linux.it
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux Test Project <ltp.lists.linux.it>
List-Unsubscribe: <https://lists.linux.it/options/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=unsubscribe>
List-Archive: <http://lists.linux.it/pipermail/ltp/>
List-Post: <mailto:ltp@lists.linux.it>
List-Help: <mailto:ltp-request@lists.linux.it?subject=help>
List-Subscribe: <https://lists.linux.it/listinfo/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=subscribe>
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

T24gVHVlLCBKdWwgMiwgMjAyNCBhdCAxMDoxNeKAr1BNIEFuZHJlYSBDZXJ2ZXNhdG8gPGFuZHJl
YS5jZXJ2ZXNhdG9Ac3VzZS5kZT4Kd3JvdGU6Cgo+IEZyb206IEFuZHJlYSBDZXJ2ZXNhdG8gPGFu
ZHJlYS5jZXJ2ZXNhdG9Ac3VzZS5jb20+Cj4KPiBUaGlzIHRlc3QgaGFzIGJlZW4gZXh0cmFjdGVk
IGZyb20gc3ltbGluazAxIHRlc3QgYW5kIGl0IGNoZWNrcyB0aGF0Cj4gbHN0YXQoKSBwcm92aWRl
cyB0aGUgcmlnaHQgaW5mb3JtYXRpb24sIGFjY29yZGluZyB3aXRoIGRldmljZSwgYWNjZXNzCj4g
dGltZSwgYmxvY2sgc2l6ZSwgb3duZXJzaGlwLCBldGMuCj4KPiBTaWduZWQtb2ZmLWJ5OiBBbmRy
ZWEgQ2VydmVzYXRvIDxhbmRyZWEuY2VydmVzYXRvQHN1c2UuY29tPgo+IC0tLQo+ICBydW50ZXN0
L3N5c2NhbGxzICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDQgKy0KPiAgdGVzdGNhc2Vz
L2tlcm5lbC9zeXNjYWxscy9sc3RhdC8uZ2l0aWdub3JlIHwgICAyICsKPiAgdGVzdGNhc2VzL2tl
cm5lbC9zeXNjYWxscy9sc3RhdC9sc3RhdDAzLmMgIHwgMTAyCj4gKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysKPiAgMyBmaWxlcyBjaGFuZ2VkLCAxMDYgaW5zZXJ0aW9ucygrKSwgMiBkZWxl
dGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9ydW50ZXN0L3N5c2NhbGxzIGIvcnVudGVzdC9zeXNj
YWxscwo+IGluZGV4IDNlN2E1Y2ExYi4uZDc4YjY4MjJiIDEwMDY0NAo+IC0tLSBhL3J1bnRlc3Qv
c3lzY2FsbHMKPiArKysgYi9ydW50ZXN0L3N5c2NhbGxzCj4gQEAgLTcyNSwxMiArNzI1LDEyIEBA
IGxzZWVrMDIgbHNlZWswMgo+ICBsc2VlazA3IGxzZWVrMDcKPiAgbHNlZWsxMSBsc2VlazExCj4K
PiAtbHN0YXQwMUEgc3ltbGluazAxIC1UIGxzdGF0MDEKPiAtbHN0YXQwMUFfNjQgc3ltbGluazAx
IC1UIGxzdGF0MDFfNjQKPiAgbHN0YXQwMSBsc3RhdDAxCj4gIGxzdGF0MDFfNjQgbHN0YXQwMV82
NAo+ICBsc3RhdDAyIGxzdGF0MDIKPiAgbHN0YXQwMl82NCBsc3RhdDAyXzY0Cj4gK2xzdGF0MDMg
bHN0YXQwMwo+ICtsc3RhdDAzXzY0IGxzdGF0MDNfNjQKPgo+ICBtYWxsaW5mbzAyIG1hbGxpbmZv
MDIKPgo+IGRpZmYgLS1naXQgYS90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL2xzdGF0Ly5naXRp
Z25vcmUKPiBiL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvbHN0YXQvLmdpdGlnbm9yZQo+IGlu
ZGV4IGE0OTdhNDQ1Zi4uNzJjYmE4NzFmIDEwMDY0NAo+IC0tLSBhL3Rlc3RjYXNlcy9rZXJuZWwv
c3lzY2FsbHMvbHN0YXQvLmdpdGlnbm9yZQo+ICsrKyBiL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2Fs
bHMvbHN0YXQvLmdpdGlnbm9yZQo+IEBAIC0yLDMgKzIsNSBAQAo+ICAvbHN0YXQwMV82NAo+ICAv
bHN0YXQwMgo+ICAvbHN0YXQwMl82NAo+ICsvbHN0YXQwMwo+ICsvbHN0YXQwM182NAo+IGRpZmYg
LS1naXQgYS90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL2xzdGF0L2xzdGF0MDMuYwo+IGIvdGVz
dGNhc2VzL2tlcm5lbC9zeXNjYWxscy9sc3RhdC9sc3RhdDAzLmMKPiBuZXcgZmlsZSBtb2RlIDEw
MDY0NAo+IGluZGV4IDAwMDAwMDAwMC4uYjUyYmEwYzM1Cj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBi
L3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvbHN0YXQvbHN0YXQwMy5jCj4gQEAgLTAsMCArMSwx
MDIgQEAKPiArLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb3ItbGF0ZXIKPiAr
LyoKPiArICogQ29weXJpZ2h0IChjKSAyMDAwIFNpbGljb24gR3JhcGhpY3MsIEluYy4gIEFsbCBS
aWdodHMgUmVzZXJ2ZWQuCj4gKyAqICAgIEF1dGhvcjogRGF2aWQgRmVubmVyLCBKb24gSGVuZHJp
Y2tzb24KPiArICogQ29weXJpZ2h0IChDKSAyMDI0IEFuZHJlYSBDZXJ2ZXNhdG8gYW5kcmVhLmNl
cnZlc2F0b0BzdXNlLmNvbQo+ICsgKi8KPiArCj4gKy8qXAo+ICsgKiBbRGVzY3JpcHRpb25dCj4g
KyAqCj4gKyAqIFRoaXMgdGVzdCB2ZXJpZmllcyB0aGF0IGxzdGF0KCkgcHJvdmlkZXMgY29ycmVj
dCBpbmZvcm1hdGlvbiBhY2NvcmRpbmcKPiArICogd2l0aCBkZXZpY2UsIGFjY2VzcyB0aW1lLCBi
bG9jayBzaXplLCBvd25lcnNoaXAsIGV0Yy4KPiArICogVGhlIGltcGxlbWVudGF0aW9uIHByb3Zp
ZGVzIGEgc2V0IG9mIHRlc3RzIHdoaWNoIGFyZSBzcGVjaWZpYyBmb3IgZWFjaAo+IG9uZQo+ICsg
KiBvZiB0aGUgYHN0cnVjdCBzdGF0YCB1c2VkIHRvIHJlYWQgZmlsZSBhbmQgc3ltbGluayBpbmZv
cm1hdGlvbi4KPiArICovCj4gKwo+ICsjaW5jbHVkZSAidHN0X3Rlc3QuaCIKPiArCj4gKyNkZWZp
bmUgRklMRU5BTUUgImZpbGUudHh0Igo+ICsjZGVmaW5lIE1OVFBPSU5UICJtbnRwb2ludCIKPiAr
I2RlZmluZSBTWU1CTkFNRSBNTlRQT0lOVCIvZmlsZV9zeW1saW5rIgo+ICsKPiArc3RhdGljIHN0
cnVjdCBzdGF0ICpmaWxlX3N0YXQ7Cj4gK3N0YXRpYyBzdHJ1Y3Qgc3RhdCAqc3ltYl9zdGF0Owo+
ICsKPiArc3RhdGljIHZvaWQgcnVuKHZvaWQpCj4gK3sKPiArICAgICAgIFRTVF9FWFBfRVhQUihm
aWxlX3N0YXQtPnN0X2RldiAhPSBzeW1iX3N0YXQtPnN0X2Rldik7Cj4gKyAgICAgICBUU1RfRVhQ
X0VYUFIoZmlsZV9zdGF0LT5zdF9tb2RlICE9IHN5bWJfc3RhdC0+c3RfbW9kZSk7Cj4gKyAgICAg
ICBUU1RfRVhQX0VYUFIoZmlsZV9zdGF0LT5zdF9ubGluayAhPSBzeW1iX3N0YXQtPnN0X25saW5r
KTsKPiArICAgICAgIFRTVF9FWFBfRVhQUihmaWxlX3N0YXQtPnN0X2lubyAhPSBzeW1iX3N0YXQt
PnN0X2lubyk7Cj4gKyAgICAgICBUU1RfRVhQX0VYUFIoZmlsZV9zdGF0LT5zdF91aWQgIT0gc3lt
Yl9zdGF0LT5zdF91aWQpOwo+ICsgICAgICAgVFNUX0VYUF9FWFBSKGZpbGVfc3RhdC0+c3RfZ2lk
ICE9IHN5bWJfc3RhdC0+c3RfZ2lkKTsKPiArICAgICAgIFRTVF9FWFBfRVhQUihmaWxlX3N0YXQt
PnN0X3NpemUgIT0gc3ltYl9zdGF0LT5zdF9zaXplKTsKPiArICAgICAgIFRTVF9FWFBfRVhQUihm
aWxlX3N0YXQtPnN0X2Jsb2NrcyAhPSBzeW1iX3N0YXQtPnN0X2Jsb2Nrcyk7Cj4gKyAgICAgICBU
U1RfRVhQX0VYUFIoZmlsZV9zdGF0LT5zdF9ibGtzaXplICE9IHN5bWJfc3RhdC0+c3RfYmxrc2l6
ZSk7Cj4gKyAgICAgICBUU1RfRVhQX0VYUFIoZmlsZV9zdGF0LT5zdF9hdGltZSAhPSBzeW1iX3N0
YXQtPnN0X2F0aW1lKTsKPiArICAgICAgIFRTVF9FWFBfRVhQUihmaWxlX3N0YXQtPnN0X210aW1l
ICE9IHN5bWJfc3RhdC0+c3RfbXRpbWUpOwo+ICsgICAgICAgVFNUX0VYUF9FWFBSKGZpbGVfc3Rh
dC0+c3RfY3RpbWUgIT0gc3ltYl9zdGF0LT5zdF9jdGltZSk7Cj4gK30KPiArCj4gK3N0YXRpYyB2
b2lkIHNldHVwKHZvaWQpCj4gK3sKPiArICAgICAgIGNoYXIgb3B0X2JzaXplWzMyXTsKPiArICAg
ICAgIGNvbnN0IGNoYXIgKmNvbnN0IGZzX29wdHNbXSA9IHtvcHRfYnNpemUsIE5VTEx9Owo+ICsg
ICAgICAgc3RydWN0IHN0YXQgc2I7Cj4gKyAgICAgICBpbnQgcGFnZXNpemU7Cj4gKyAgICAgICBp
bnQgZmQ7Cj4gKwo+ICsgICAgICAgLyogY2hhbmdlIHN0X2Jsa3NpemUgLyBzdF9kZXYgKi8KPiAr
ICAgICAgIFNBRkVfU1RBVCgiLiIsICZzYik7Cj4gKyAgICAgICBwYWdlc2l6ZSA9IHNiLnN0X2Js
a3NpemUgPT0gNDA5NiA/IDEwMjQgOiA0MDk2Owo+ICsKPiArICAgICAgIHNucHJpbnRmKG9wdF9i
c2l6ZSwgc2l6ZW9mKG9wdF9ic2l6ZSksICItYiAlaSIsIHBhZ2VzaXplKTsKPiArICAgICAgIFNB
RkVfTUtGUyh0c3RfZGV2aWNlLT5kZXYsIHRzdF9kZXZpY2UtPmZzX3R5cGUsIGZzX29wdHMsIE5V
TEwpOwo+ICsgICAgICAgU0FGRV9NT1VOVCh0c3RfZGV2aWNlLT5kZXYsIE1OVFBPSU5ULCB0c3Rf
ZGV2aWNlLT5mc190eXBlLCAwLCAwKTsKPiArCj4gKyAgICAgICBTQUZFX1RPVUNIKEZJTEVOQU1F
LCAwNzc3LCBOVUxMKTsKPiArCj4gKyAgICAgICAvKiBjaGFuZ2Ugc3RfbmxpbmsgKi8KPiArICAg
ICAgIFNBRkVfTElOSyhGSUxFTkFNRSwgImxpbmtlZF9maWxlIik7Cj4gKwo+ICsgICAgICAgLyog
Y2hhbmdlIHN0X3VpZCBhbmQgc3RfZ2lkICovCj4gKyAgICAgICBTQUZFX0NIT1dOKEZJTEVOQU1F
LCAxMDAwLCAxMDAwKTsKPiArCj4gKyAgICAgICAvKiBjaGFuZ2Ugc3Rfc2l6ZSAqLwo+ICsgICAg
ICAgZmQgPSBTQUZFX09QRU4oRklMRU5BTUUsIE9fV1JPTkxZLCAwNzc3KTsKPiArICAgICAgIHRz
dF9maWxsX2ZkKGZkLCAnYScsIFRTVF9LQiwgNTAwKTsKPiArICAgICAgIFNBRkVfQ0xPU0UoZmQp
Owo+ICsKPiArICAgICAgIC8qIGNoYW5nZSBzdF9hdGltZSAvIHN0X210aW1lIC8gc3RfY3RpbWUg
Ki8KPiArICAgICAgIHNsZWVwKDEpOwo+ICsKPiArICAgICAgIFNBRkVfU1lNTElOSyhGSUxFTkFN
RSwgU1lNQk5BTUUpOwo+ICsKPgoKCgo+ICsgICAgICAgU0FGRV9MU1RBVChGSUxFTkFNRSwgZmls
ZV9zdGF0KTsKPiArICAgICAgIFNBRkVfTFNUQVQoU1lNQk5BTUUsIHN5bWJfc3RhdCk7Cj4KCk1h
eWJlIGl0IHdvdWxkIGJlIGJldHRlciB0byBtb3ZlIHRob3NlIHR3byBsaW5lcyBpbnRvIHJ1bigp
IGZ1bmN0aW9uLgpJdCBtYWtlcyB0aGUgdGVzdCByZWFsIHBlcmZvcm1lZCBhZ2FpbiB3aGVuIHVz
aW5nICctaSAyJyBwYXJhbWV0ZXIuCgoKCj4gK30KPiArCj4gK3N0YXRpYyB2b2lkIGNsZWFudXAo
dm9pZCkKPiArewo+ICsgICAgICAgU0FGRV9VTkxJTksoU1lNQk5BTUUpOwo+ICsKPiArICAgICAg
IGlmICh0c3RfaXNfbW91bnRlZChNTlRQT0lOVCkpCj4gKyAgICAgICAgICAgICAgIFNBRkVfVU1P
VU5UKE1OVFBPSU5UKTsKPiArfQo+ICsKPiArc3RhdGljIHN0cnVjdCB0c3RfdGVzdCB0ZXN0ID0g
ewo+ICsgICAgICAgLnNldHVwID0gc2V0dXAsCj4gKyAgICAgICAuY2xlYW51cCA9IGNsZWFudXAs
Cj4gKyAgICAgICAudGVzdF9hbGwgPSBydW4sCj4gKyAgICAgICAubmVlZHNfcm9vdCA9IDEsCj4g
KyAgICAgICAubmVlZHNfdG1wZGlyID0gMSwKPiArICAgICAgIC5uZWVkc19kZXZpY2UgPSAxLAo+
ICsgICAgICAgLm1udHBvaW50ID0gTU5UUE9JTlQsCj4gKyAgICAgICAuZGV2X2ZzX3R5cGUgPSAi
ZXh0MiIsCj4gKyAgICAgICAuYnVmcyA9IChzdHJ1Y3QgdHN0X2J1ZmZlcnMgW10pIHsKPiArICAg
ICAgICAgICAgICAgeyZmaWxlX3N0YXQsIC5zaXplID0gc2l6ZW9mKHN0cnVjdCBzdGF0KX0sCj4g
KyAgICAgICAgICAgICAgIHsmc3ltYl9zdGF0LCAuc2l6ZSA9IHNpemVvZihzdHJ1Y3Qgc3RhdCl9
LAo+ICsgICAgICAgICAgICAgICB7fQo+ICsgICAgICAgfQo+ICt9Owo+Cj4gLS0KPiAyLjQzLjAK
Pgo+Cj4gLS0KPiBNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0
aW5mby9sdHAKPgo+CgotLSAKUmVnYXJkcywKTGkgV2FuZwoKLS0gCk1haWxpbmcgbGlzdCBpbmZv
OiBodHRwczovL2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=
