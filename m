Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 91DECB44E3C
	for <lists+linux-ltp@lfdr.de>; Fri,  5 Sep 2025 08:50:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1757055027; h=mime-version :
 references : in-reply-to : date : message-id : to : subject : list-id
 : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : cc : content-type :
 content-transfer-encoding : sender : from;
 bh=gjuETt76hfMCr8XqTlBwpRIbt6dnAygpzcX1yuXgq88=;
 b=dFdQ/0wcBIpjycb7mbga3+ImFMW2uQYxn1P4muuecfXYoWtn/JNhEmWrsVZ7Z/clkQ//j
 yB0jVpWRipyMxR4knbo0E+WOINdIB7SLfaxRJpJGyPOYutFkAvjXbkPBfLtatiyZozqlZbM
 1SVQndAwraLokdxVs1fXUM7lpPW0to0=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3174C3CD1B1
	for <lists+linux-ltp@lfdr.de>; Fri,  5 Sep 2025 08:50:27 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 8DAF43CC3B6
 for <ltp@lists.linux.it>; Fri,  5 Sep 2025 08:50:23 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 1F15960083A
 for <ltp@lists.linux.it>; Fri,  5 Sep 2025 08:50:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1757055020;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3GvhtK5k/MbFlaOVcm9NdxiLO5UjAN2sLvguDjFpXbI=;
 b=RCRHULwfo3QDl1r20+l4UpSY60ivwF8gNxCKkhQd74bFkknhsxavkra7obaaiTeNajGPBe
 qJ4qG8MlIIG8aZo0ANYa6nbT97HURWSPPGEgt54VvLwVjCy1/4US8LeHK07iD9w89Z9enO
 5yLcBTzJtak3aTDTrVIcJ4tHaVBO7hM=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-638-ix-2QeU9OKqpADi8Ssi3yw-1; Fri, 05 Sep 2025 02:50:18 -0400
X-MC-Unique: ix-2QeU9OKqpADi8Ssi3yw-1
X-Mimecast-MFC-AGG-ID: ix-2QeU9OKqpADi8Ssi3yw_1757055017
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-24b2b347073so26770205ad.1
 for <ltp@lists.linux.it>; Thu, 04 Sep 2025 23:50:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757055017; x=1757659817;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3GvhtK5k/MbFlaOVcm9NdxiLO5UjAN2sLvguDjFpXbI=;
 b=MrOnPP2xZx+d/hM6kfd75T7UKtctFAdG+puVUJZplywq2dNK4xYHAb0LVIgIWwZwct
 d1+VyCSJYS/bLVVapn3ix5ia4Sd1suru1FPQhFErzX78VpBcL3WlJenNqzMmnpS4Rbs9
 1E7rugImL9bhLhdtjTO7AZm3RKD4zRmFm/rg5S6mrxYoiRYQGh05dfaPACRfZ8zdG1Qu
 MLVCCAcXfJuEmnkAz34Grk2JUncjDS26u7qeIMc0/vwsUfo38j18ECQIXBNpeubW1Mth
 wB02bTnqgEWvHXxV6TwNzjy2UHO+JfT99eJ+fT/H/LRIc46I0L7hSmzYuO9wGrDKgv/s
 82tQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWOALm0DIbyCq1v4VXH257Jr0xLyFEGDf6rQkj7IAUjpWPcjtbcxXXZuRx3CIN6XuODp6Y=@lists.linux.it
X-Gm-Message-State: AOJu0YyUdqe2pEjoL/hvYl1X6BvQowOzquEFoyU3jP/lkcXVt5lLSIaD
 nlzCIKZhIgzCJk3E/8mekbHTkXfUUaRXWzxX+QvTq9/zvAMfC3Kj2YR4zyxrX21l7Vg4xl1Gj4Y
 YTa8eDPcIDY3h2P3Ktrxa3BEreiT6U4I7Tj0E3sllELsaLs2lCgRQtgXwff0nDQ+o7OIpHP1XYt
 2cC/jCExFBCDuvbcqkqkUqI5KYD8E=
X-Gm-Gg: ASbGncvTn36rnOS4JuogB/puj9GVdXMKZVmR2axvGxXMLQw1ppCk3I8F8S2yTCP8ulV
 tKhNrCUFuJZrqWFtQTJLkRMEVJZGuFtjk3eQLrnJ6Fanx9M8YYyXHLcCg1TV85w2NkQFrjD//EN
 ABmmAcOh7A1bjjliI3dktjuw==
X-Received: by 2002:a17:903:2347:b0:24a:8d5e:932 with SMTP id
 d9443c01a7336-24a8d5e0c28mr270002205ad.23.1757055017321; 
 Thu, 04 Sep 2025 23:50:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFyfWddgSGLu/pzHhmxf2TqRqWfaEfdlHYIxgpPK2bMG9tNRJCPDEccwFIHaYG8lX2fublc1cF3kMJYLfgGewc=
X-Received: by 2002:a17:903:2347:b0:24a:8d5e:932 with SMTP id
 d9443c01a7336-24a8d5e0c28mr270001765ad.23.1757055016871; Thu, 04 Sep 2025
 23:50:16 -0700 (PDT)
MIME-Version: 1.0
References: <20250904102609.133359-1-liwang@redhat.com>
 <20250904110018.GA56668@pevik> <aLl7ConfYPBglqhx@rei.lan>
 <CAEemH2f=6MRZTk95ZctgPG-MKdyw5oK9WNgh3Tm8WNHQ9NcW_g@mail.gmail.com>
 <aLmwLn9RDo2qmk7K@yuki.lan>
 <CAEemH2cK3idxQHmpSGs8VuWSOosHrFNYK=ic0s90B_WNh7AVjw@mail.gmail.com>
 <CAEemH2cXQ=_F=Bq5CZN1j=SbeceDCKCdZh4jDdGSz-x10XZLtA@mail.gmail.com>
In-Reply-To: <CAEemH2cXQ=_F=Bq5CZN1j=SbeceDCKCdZh4jDdGSz-x10XZLtA@mail.gmail.com>
Date: Fri, 5 Sep 2025 14:50:05 +0800
X-Gm-Features: Ac12FXwfVih4gqbSHwVwaSJuomlP6E_5bUF3t1DLRqktRriPhQ5kPuUyIyDtpL0
Message-ID: <CAEemH2fTzN5ekxkNFvZp3NP3bFOQRG1KhAc6KM=q-eaCQkGbZA@mail.gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: irS7gZLtF0vZ6y-nWRKKlMrE-DjuSjIbn2ftkdMAue8_1757055017
X-Mimecast-Originator: redhat.com
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,DMARC_PASS,HTML_MESSAGE,SPF_HELO_PASS,
 SPF_PASS shortcircuit=no autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-2.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.7 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
Subject: Re: [LTP] [PATCH v2] sched_football: synchronize with kickoff flag
 to reduce skew
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
From: Li Wang via ltp <ltp@lists.linux.it>
Reply-To: Li Wang <liwang@redhat.com>
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

T24gRnJpLCBTZXAgNSwgMjAyNSBhdCAxMjowM+KAr1BNIExpIFdhbmcgPGxpd2FuZ0ByZWRoYXQu
Y29tPiB3cm90ZToKCj4KPgo+IE9uIEZyaSwgU2VwIDUsIDIwMjUgYXQgODo1NOKAr0FNIExpIFdh
bmcgPGxpd2FuZ0ByZWRoYXQuY29tPiB3cm90ZToKPgo+Pgo+Pgo+PiBPbiBUaHUsIFNlcCA0LCAy
MDI1IGF0IDExOjI44oCvUE0gQ3lyaWwgSHJ1YmlzIDxjaHJ1YmlzQHN1c2UuY3o+IHdyb3RlOgo+
Pgo+Pj4gSGkhCj4+PiA+ID4gPiA+ICBzdGF0aWMgdm9pZCBkb19zZXR1cCh2b2lkKQo+Pj4gPiA+
ID4gPiAgewo+Pj4gPiA+ID4gPiArICAgaWYgKCF0c3RfY2hlY2tfcHJlZW1wdF9ydCgpKQo+Pj4g
PiA+ID4gPiArICAgICAgICAgICB0c3RfYnJrKFRDT05GLCAiVGVzdCByZXF1aXJlcyByZWFsLXRp
bWUga2VybmVsIik7Cj4+PiA+ID4gPgo+Pj4gPiA+ID4gSSB1bmRlcnN0b29kIEN5cmlsIGlzIHJl
YWxseSBzdWdnZXN0aW5nIHRvIGtlZXAgaXQgWzFdLiBJIHdvdWxkCj4+PiBhbHNvCj4+PiA+ID4g
dm90ZSB0bwo+Pj4gPiA+ID4ga2VlcCBpdCAod2Ugc3RpbGwgaGF2ZSBzb21lIHRpbWUgdG8gc2Vl
IGlmIGl0IGdvdCBmaXhlZCBiZWZvcmUKPj4+IHJlbGVhc2UpLgo+Pj4gPiA+ID4KPj4+ID4gPiA+
IEkga25vdyB3ZSBoYWQgdGhpcyBkaXNjdXNzaW9uIGluIHRoZSBwYXN0IChzb21lIG9mIHlvdXIg
Y29sbGVhZ3VlCj4+PiA+ID4gc3VnZ2VzdGluZyBpdAo+Pj4gPiA+ID4gc2hvdWxkIG5vdCBiZSBy
dW4gb24gbm9uLVJUIGtlcm5lbCksIHNvIEknbSBub3QgcHVzaGluZyBmb3IgaXQuCj4+PiA+ID4K
Pj4+ID4gPiBJIHN0aWwgZG8gbm90IHVuZGVyc3RhbmQgcmVhc29ucyBmb3IgZGlzYWJsaW5nIHRo
ZSB0ZXN0LiBUaGUgUE9TSVgKPj4+ID4gPiByZWFsdGltZSBzY2hlZHVsbGluZyBjbGFzc2VzIGhh
dmUgdG8gd29yayBwcm9wZXJseSByZWdhcmRsZXNzIG9mIHRoZQo+Pj4gPiA+IGtlcm5lbCBmbGF2
b3IuIFdoeSBzaG91bGQgd2UgdHVybiB0aGUgdGVzdCBvZmYgb24gbm9uLXJ0IGtlcm5lbCB0aGVu
Pwo+Pj4gPiA+Cj4+PiA+Cj4+PiA+IE5vIHNwZWNpYWwgcmVhc29ucy4gSSBzdGlsbCBjYW4gc3Bv
cmFkaWNhbGx5IGNhdGNoIHRoZSBmYWlsdXJlIG9uCj4+PiBub24tUlQKPj4+ID4ga2VybmVsIHdp
dGggZXZlbiBzbGVlcCAyIHNlY29uZHMuCj4+Pgo+Pj4gVGhhdCBpcyB2ZXJ5IHN0cmFuZ2UuIFRo
ZSBTQ0hFRF9GSUZPIHRocmVhZHMgc2hvdWxkIHByZWVtcHR5IGFueSBsb3dlcgo+Pj4gcHJpbyB0
aHJlYWQgYXMgbG9uZyBhcyB0aGV5IGJlY29tZSBydW5hYmxlIGFuZCBzaG91bGQgc3RheSBydW5u
aW5nIHVudGlsCj4+PiB0aGV5IGZpbmlzaCBvciB5aWVsZC4gVHdvIHNlY29uZHMgc2hvdWxkIGJl
IG1vcmUgdGhhbiBlbm91Z2ggZm9yIHRoYXQgdG8KPj4+IGhhcHBlbi4KPj4+Cj4+PiA+IFRodXMs
IEkgdG9vayB0aGlzIHZlcnkgZXh0cmVtZSBhcHByb2FjaCwgYmVjYXVzZSBvbiBub24tUlQga2Vy
bmVsLAo+Pj4gc2xlZXAKPj4+ID4gbWF5IG5vdCBoYXZlIGEgcGFydGljdWxhcmx5IHBlcmZlY3Qg
ZWZmZWN0LCBJIGd1ZXNzIHRoZSBzdG9jayBrZXJuZWwKPj4+IHdpdGgKPj4+ID4gc2NoZWRfc2V0
c2NoZWR1bGVyKCwgU0NIRURfRklGTywgKSBpcyBzdGlsbCBoYXMgc2NoZWR1bGluZyBza2V3IHdp
dGgKPj4+ID4gd29ya2xvYWQuCj4+Pgo+Pj4gRG9lcyB0aGlzIGhhcHBlbiBvbiB2YW5pbGxhIExp
bnV4IGFzIHdlbGwgb3Igb25seSBvbiBSZWRIYXQga2VybmVscz8KPj4+Cj4+Cj4+IFllcywgYm90
aCB2YW5pbGxhIExpbnV4IGFuZCBDZW50T1Mga2VybmVscy4KPj4KPj4gbW9yZSBDSSB0ZXN0IGhp
c3RvcnkgZm9yIHNjaGVkX2Zvb3RiYWxsOgo+Pgo+PiAgICBXaXRob3V0IGJhcnJpZXIgcGF0Y2g6
Cj4+ICAgICAgICAgICAgRmFpbHMgb24gYm90aCBSVCBhbmQgbm9uLVJUIENlbnRPUyBTdHJlYW0g
OS8xMCBrZXJuZWxzCj4+ICAgICAgICAgICAgRmFpbHMgb24gbm9uLVJUIG1haW5saW5lIHY2LjE3
LXJjNCBrZXJuZWxzLiAobm90IGJ1aWxkIHY2LjE3Cj4+IFJUIGtlcm5lbCkKPj4KPj4gICAoXiB0
aGF0J3Mgd2h5IHdlIHN0YXJ0ZWQgdG8gbG9vayBpbnRvIHRoZSBmYWlsdXJlIGFuZCBzdWJtaXQg
dGhlIGNvbW1pdAo+PiBlNTIzYmE4OGRkOWIpCj4+Cj4+ICAgIFdpdGggYmFycmllciBwYXRjaDoK
Pj4gICAgICAgICAgICBGYWlscyBvbiBib3RoIFJUIGFuZCBub24tUlQgQ2VudE9TIGtlcm5lbHMs
IGJ1dCB0aGUgZmluYWwKPj4gYmFsbCBwb3NpdGlvbiBpcyBub3RpY2VhYmx5IGxvd2VyLgo+PiAg
ICAgICAgICAgIEZhaWxzIG9uIG5vbi1SVCBtYWlubGluZSB2Ni4xNy1yYzQga2VybmVscy4gKG5v
dCBidWlsZCB2Ni4xNwo+PiBSVCBrZXJuZWwpCj4+Cj4+ICAgIFdpdGggYmFycmllciBwYXRjaCAr
IGtpY2tvZmYgZmxhZyBlbmhhbmNlbWVudDoKPj4gICAgICAgICAgICBGYWlscyBvbiB0aGUgbm9u
LVJUIENlbnRPUyBTdHJlYW0gMTAga2VybmVsCj4+ICAgICAgICAgICAgRmFpbHMgb24gbm9uLVJU
IG1haW5saW5lIHY2LjE3LXJjNCBrZXJuZWwuIChub3QgYnVpbGQgdjYuMTcKPj4gUlQta2VybmVs
KQo+PiAgICAgICAgICAgIFBhc3NlZCBvbiBSVCBDZW50T1Mgc3RyZWFtIGtlcm5lbAo+Pgo+PiAo
XiBoZXJlIEkgc3RhcnRlZCB0byBzdXNwZWN0IHRoZSBTQ0hFRF9GSUZPIHRocmVhZHMgY2FuIG5v
dCBwZXJmb3JtIHdlbGwKPj4gbGlrZSBSVC1rZXJuZWwpCj4+Cj4+Cj4+IFtyb290QGRlbGwtcGVy
NzYyNS0wMSBzY2hlZF9mb290YmFsbF0jIHVuYW1lIC1yCj4+IDYuMTcuMC1yYzQubGl3YW5nCj4+
Cj4+IFtyb290QGRlbGwtcGVyNzYyNS0wMSBzY2hlZF9mb290YmFsbF0jIC4vc2NoZWRfZm9vdGJh
bGwKPj4gdHN0X3Rlc3QuYzoyMDA0OiBUSU5GTzogTFRQIHZlcnNpb246IDIwMjUwNTMwCj4+IHRz
dF90ZXN0LmM6MjAwNzogVElORk86IFRlc3RlZCBrZXJuZWw6IDYuMTcuMC1yYzQubGl3YW5nICMx
IFNNUAo+PiBQUkVFTVBUX0RZTkFNSUMgVGh1IFNlcCAgNCAyMDowNzoyMCBFRFQgMjAyNSB4ODZf
NjQKPj4gdHN0X2tjb25maWcuYzo4ODogVElORk86IFBhcnNpbmcga2VybmVsIGNvbmZpZwo+PiAn
L2xpYi9tb2R1bGVzLzYuMTcuMC1yYzQubGl3YW5nL2J1aWxkLy5jb25maWcnCj4+IHRzdF9rY29u
ZmlnLmM6Njc2OiBUSU5GTzogQ09ORklHX0ZBVUxUX0lOSkVDVElPTiBrZXJuZWwgb3B0aW9uIGRl
dGVjdGVkCj4+IHdoaWNoIG1pZ2h0IHNsb3cgdGhlIGV4ZWN1dGlvbgo+PiB0c3RfdGVzdC5jOjE4
MjU6IFRJTkZPOiBPdmVyYWxsIHRpbWVvdXQgcGVyIHJ1biBpcyAwaCAwMm0gMDBzCj4+IHNjaGVk
X2Zvb3RiYWxsLmM6MTYyOiBUSU5GTzogcGxheWVyc19wZXJfdGVhbTogMzIgZ2FtZV9sZW5ndGg6
IDUKPj4gc2NoZWRfZm9vdGJhbGwuYzoxNzg6IFRJTkZPOiBTdGFydGluZyAzMiBvZmZlbnNlIHRo
cmVhZHMgYXQgcHJpb3JpdHkgMTUKPj4gc2NoZWRfZm9vdGJhbGwuYzoxODU6IFRJTkZPOiBTdGFy
dGluZyAzMiBkZWZlbnNlIHRocmVhZHMgYXQgcHJpb3JpdHkgMzAKPj4gc2NoZWRfZm9vdGJhbGwu
YzoxOTI6IFRJTkZPOiBTdGFydGluZyA2NCBjcmF6eS1mYW4gdGhyZWFkcyBhdCBwcmlvcml0eSA1
MAo+PiBzY2hlZF9mb290YmFsbC5jOjExODogVElORk86IFN0YXJ0aW5nIHJlZmVyZWUgdGhyZWFk
Cj4+IHNjaGVkX2Zvb3RiYWxsLmM6MTIxOiBUSU5GTzogU3RhcnRpbmcgdGhlIGdhbWUgKDUgc2Vj
KQo+PiBzY2hlZF9mb290YmFsbC5jOjE0NDogVElORk86IEZpbmFsIGJhbGwgcG9zaXRpb246IDIw
MjA1Cj4+IHNjaGVkX2Zvb3RiYWxsLmM6MTUwOiBURkFJTDogRXhwZWN0OiBmaW5hbF9iYWxsID09
IDAKPj4KPgo+Cj4gQ2hlY2tpbmcgdGhlIGNvbmZpZ3VyYXRpb25zIG9mIHRoZSBzdG9jayBrZXJu
ZWwgYW5kIHRoZSByZWFsLXRpbWUKPiBrZXJuZWwsIHRoZSBzdG9jayBrZXJuZWwgdXNlcyAiQ09O
RklHX1BSRUVNUFRfVk9MVU5UQVJZPXksIgo+IHdoaWNoIG9ubHkgcHJvdmlkZXMgdm9sdW50YXJ5
IHByZWVtcHRpb24uCj4KPiBUaGlzIHByZWVtcHRpb24gbW9kZWwgaXMgZGVzaWduZWQgdG8gc3Ry
aWtlIGEgYmFsYW5jZSBiZXR3ZWVuIHRocm91Z2hwdXQKPiBhbmQgbGF0ZW5jeS4gSXQgb25seSBh
bGxvd3MgdGhlIGtlcm5lbCB0byBiZSBwcmVlbXB0ZWQgYXQgc3BlY2lmaWMsIHdlbGwKPiBkZWZp
bmVkCj4gInNhZmUgcG9pbnRzLCIgcG90ZW50aWFsbHkgcmVzdWx0aW5nIGluIGxvbmcsIHVuYm91
bmRlZCBsYXRlbmNpZXMuCj4KPiBIb3dldmVyLCB0aGUgc2NoZWRfZm9vdGJhbGwgdGVzdCB3YXMg
bW9zdCBsaWtlbHkgZGVzaWduZWQgdG8gbWVhc3VyZSBvcgo+IHN0cmVzcy10ZXN0IHRoZSBkZXRl
cm1pbmlzdGljLCBsb3ctbGF0ZW5jeSBzY2hlZHVsaW5nIGJlaGF2aW9yIHRoYXQgaXMKPiBjaGFy
YWN0ZXJpc3RpYyBvZiByZWFsLXRpbWUgKFJUKSBrZXJuZWwuCj4KPiBTbywgSSB0ZW5kIHRvIGJl
bGlldmUgdGhlIHRlc3QncyBmYWlsdXJlIG9uIHRoZSBzdG9jayBrZXJuZWwgaXMKPiBhY2NlcHRh
YmxlLgo+IEFuZCwgYnkgdGhlIHdheSwgd2hhdCBkb2VzIHRoZSBTVVNFIGtlcm5lbCBjb25maWd1
cmF0aW9uIGxvb2sgbGlrZT8KPgo+Cj4gIyBncmVwIENPTkZJR19QUkVFTVBUIC9ib290L2NvbmZp
Zy02LjEyLjAtNTUuMjkuMS5lbDEwXzAueDg2XzY0Cj4gQ09ORklHX1BSRUVNUFRfQlVJTEQ9eQo+
IENPTkZJR19QUkVFTVBUX1ZPTFVOVEFSWT15Cj4gIyBDT05GSUdfUFJFRU1QVCBpcyBub3Qgc2V0
Cj4gIyBDT05GSUdfUFJFRU1QVF9SVCBpcyBub3Qgc2V0Cj4gQ09ORklHX1BSRUVNUFRfQ09VTlQ9
eQo+IENPTkZJR19QUkVFTVBUSU9OPXkKPgoKCj4gQ09ORklHX1BSRUVNUFRfRFlOQU1JQz15Cj4K
CkFzIENodW55dSBwb2ludGVkIG91dCB0byBtZSAob24gU2xhY2spIGhlIHNhdyB0aGF0IHRoZSBz
dG9jayBrZXJuZWwKZW5hYmxlcyBkeW5hbWljYWwgcHJlZW1wdGlvbiBzd2l0Y2guCgpUaGUgZGVm
YXVsdCB2YWx1ZSBvZiBDZW50T1MvUkhFTCBpcyAndm9sdW50YXJ5JzoKCiMgY2F0IC9zeXMva2Vy
bmVsL2RlYnVnL3NjaGVkL3ByZWVtcHQKbm9uZSAodm9sdW50YXJ5KSBmdWxsIGxhenkKCk9uY2Ug
YWZ0ZXIgc3dpdGNoaW5nIHByZWVtcHQgdG8gdGhlICdmdWxsJywgc2NoZWRfZm9vdGJhbGwgd291
bGRuJ3QgZmFpbCBvbgp0aGUgdjYuMTctcmM0IHN0b2NrIGtlcm5lbHMuCgpTbyBJIGd1ZXNzIHdl
IHByb2JhYmx5IG5lZWQgdG8gYWNoaWV2ZSBhIHNlcGFyYXRlIGZ1bmN0aW9uIGxpa2UKc3dpdGNo
X3ByZWVtcHRfbW9kZWwoImZ1bGwiKTsgdG8gc3dpdGNoIHRvIHRoZSBmdWxsIHByZWVtcHQKYmVm
b3JlIGRvaW5nIHRoZSB0ZXN0IG9uIHRoZSBzdG9jayBrZXJuZWwuCgooQW5kLCB0aGUgQ2VudE9T
IHN0b2NrIGtlcm5lbCBzdGlsbCBjYXRjaGVzIGZhaWxzLCBDaHVueXUgYWxzbyBwb2ludGVkCnRo
ZXJlIG1heSBiZSByZWxhdGVkIHRvIHRoZSBsb2FkIGJhbGFuY2UsIGFuZCBwZXJoYXBzIGFub3Ro
ZXIgdGhpbmcKaXMgdGhhdCB3ZSBjcmVhdGUgQ1BVLW51bWJlciBkZWZlbnNlIHRocmVhZHMsIGJ1
dCB1bmxlc3MgdGhleSBhcmUKQ1BVLXBpbm5lZCwgdGhlIHNjaGVkdWxlciBtaWdodCBub3Qga2Vl
cCB0aGVtIDE6MSBhZ2FpbnN0IG9mZmVuc2UKdGhyZWFkcy4gU29tZSBDUFVzIG1heSBtb21lbnRh
cmlseSBydW4gb2ZmZW5zZSBpZiB0aGVpciBkZWZlbnNlCnBhcnRuZXIgaXNu4oCZdCBzY2hlZHVs
ZWQgeWV0LgpTbywgSSB3aWxsIHRyeSB0byB0ZXN0IGJpbmQgdGhlIHRocmVhZCB0byBlYWNoIENQ
VSBhbmQgcmV0ZXN0IGl0IG9uIENlbnRPUykKCgoKPiBDT05GSUdfUFJFRU1QVF9SQ1U9eQo+IENP
TkZJR19QUkVFTVBUX05PVElGSUVSUz15Cj4KPiAoXiBJIGJ1aWx0IG15IHY2LjE3LXJjNCB3aXRo
IHRoaXMgY29uZmlnIHRvbykKPgo+Cj4gIyBncmVwIENPTkZJR19QUkVFTVBUIC9ib290L2NvbmZp
Zy02LjEyLjAtNTUuMzEuMS5lbDEwXzAueDg2XzY0K3J0Cj4gQ09ORklHX1BSRUVNUFRfQlVJTEQ9
eQo+IENPTkZJR19QUkVFTVBUPXkKPiBDT05GSUdfUFJFRU1QVF9SVD15Cj4gQ09ORklHX1BSRUVN
UFRfQ09VTlQ9eQo+IENPTkZJR19QUkVFTVBUSU9OPXkKPiAjIENPTkZJR19QUkVFTVBUX0RZTkFN
SUMgaXMgbm90IHNldAo+IENPTkZJR19QUkVFTVBUX1JDVT15Cj4gQ09ORklHX1BSRUVNUFRfTk9U
SUZJRVJTPXkKPgo+Cj4gLS0KPiBSZWdhcmRzLAo+IExpIFdhbmcKPgoKCi0tIApSZWdhcmRzLApM
aSBXYW5nCgotLSAKTWFpbGluZyBsaXN0IGluZm86IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlz
dGluZm8vbHRwCg==
