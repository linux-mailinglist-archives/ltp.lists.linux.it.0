Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id CF39D7D0C0F
	for <lists+linux-ltp@lfdr.de>; Fri, 20 Oct 2023 11:37:37 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C60AE3CD066
	for <lists+linux-ltp@lfdr.de>; Fri, 20 Oct 2023 11:37:36 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id EF3733C8927
 for <ltp@lists.linux.it>; Fri, 20 Oct 2023 11:37:32 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 2105A1A00CA7
 for <ltp@lists.linux.it>; Fri, 20 Oct 2023 11:37:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1697794650;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9gaaqmsKs+4btSaZyS/2FToRhdahrHVml/zMky8oBjU=;
 b=aNKm4g5iAGZ7iJOeZDrtjMyLdm/4DypfqSAg4xzfN/iQBYX39IARDaoSm/qMzhPvb4VT2J
 rdaSLyZDlT9ZsT4f/aZA2VONWOnNF01HEIPJodHOlfti//qkfK+EobofkzIGYmNI5Ha/sj
 yBNTpzY5J+GYupq5Rp1NYcjfteOe1/8=
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com
 [209.85.217.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-668-fUWP1gpgN2u0nLanScC1TQ-1; Fri, 20 Oct 2023 05:37:12 -0400
X-MC-Unique: fUWP1gpgN2u0nLanScC1TQ-1
Received: by mail-vs1-f69.google.com with SMTP id
 ada2fe7eead31-457c7e76d30so230962137.1
 for <ltp@lists.linux.it>; Fri, 20 Oct 2023 02:37:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697794632; x=1698399432;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9gaaqmsKs+4btSaZyS/2FToRhdahrHVml/zMky8oBjU=;
 b=SdnBUUYOuOSaU2JO2LCwbtjx4FgNGbNCkbU1kZlnt/zg2qs56hOWwUrb0v2BDkyPMv
 TcRXYqthIbIivM6O1vriB8D9W+0qlr5G59gg5PLHyhwrLy4DIqw1Vy6xbObsLeVPPuQm
 sFmmjNBzJ18jxz5nGZ3tgBk2yAup83R2035xZlsEVlVN4O1rVUKt/l6pulOqvbp8F66e
 8ywnejFTDQAYhAIKODG6EaIpstNAWWL1Mn0VknLw17aj3UGo3pQDVg8v9BR0ORAWsRJ8
 GWhj8/hKirQrtR5rFSiOPXVsq9qjGzbt8kDtxllWZ4CiTT3gogegGBi00ZBL6deP1w/G
 JAWg==
X-Gm-Message-State: AOJu0YzRsVoQjcDdmthCJbjin0uM5m+14t6VCnt/2PWZ6gZ3X73SqNoK
 BJ2McNcM69C3TDcP78r/QdVLeOXoY1qwZbGdYmLmy4KUSZnW1IhPT9zUkTpaPHuoCyF/dB0zoY5
 J0/W1IyNUuHCjfs3Ri1EGrThdCoM=
X-Received: by 2002:a67:e047:0:b0:457:c415:a495 with SMTP id
 n7-20020a67e047000000b00457c415a495mr1309013vsl.10.1697794632319; 
 Fri, 20 Oct 2023 02:37:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFPu5X/Z8kHt/mXeeOi2chNcJQjL6oL72nxdZoAC50Bh6ljK72YfL2nX/Pv0W3z13mN4NQlGUj66BFxIUdkbPQ=
X-Received: by 2002:a67:e047:0:b0:457:c415:a495 with SMTP id
 n7-20020a67e047000000b00457c415a495mr1309002vsl.10.1697794631986; Fri, 20 Oct
 2023 02:37:11 -0700 (PDT)
MIME-Version: 1.0
References: <345e84821f2319d24ce8b9b84f5e038d53a2c9d5.1697715265.git.jstancek@redhat.com>
 <CAEemH2eehMwAHfwAPOhqmixwwdM2=8XsjqNP1Mkw28yjHjRpwA@mail.gmail.com>
In-Reply-To: <CAEemH2eehMwAHfwAPOhqmixwwdM2=8XsjqNP1Mkw28yjHjRpwA@mail.gmail.com>
From: Jan Stancek <jstancek@redhat.com>
Date: Fri, 20 Oct 2023 11:37:45 +0200
Message-ID: <CAASaF6xd6DP=pH6tMsWh+iw5ng=RZutTsegXLOG90_krZr+BOQ@mail.gmail.com>
To: Li Wang <liwang@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 1.0.1 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/gettid02: fix s390x and couple races
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

T24gRnJpLCBPY3QgMjAsIDIwMjMgYXQgMTE6MjPigK9BTSBMaSBXYW5nIDxsaXdhbmdAcmVkaGF0
LmNvbT4gd3JvdGU6Cj4KPgo+Cj4gT24gVGh1LCBPY3QgMTksIDIwMjMgYXQgNzo0MOKAr1BNIEph
biBTdGFuY2VrIDxqc3RhbmNla0ByZWRoYXQuY29tPiB3cm90ZToKPj4KPj4gczM5MHggaXMgYmln
IGVuZGlhbiB3aGVyZSBzaXplb2YoaW50KSA9PSA0IGFuZCBzaXplb2Yodm9pZCAqKSA9PSA4Lgo+
PiBUaGlzIHRlc3QgY3VycmVudGx5IGZhaWxzIG9uIHMzOTB4IGJlY2F1c2UgaW4gcHRocmVhZF9q
b2luLCAiJnRpZHNbaV0iCj4+IGlzIHRyZWF0ZWQgYXMgInZvaWQqKiIgYW5kIGR1ZSB0byBkaWZm
ZXJlbnQgdHlwZSBzaXplIGl0IHdyaXRlcyBvdmVyCj4+IDIgZW50cmllcyBvZiB0aWRzW10gYXJy
YXkuIFNvIGZvciBzbWFsbCB0aWQgdmFsdWVzIHRlc3QgcmVwb3J0czoKPj4gICAgICAgICBnZXR0
aWQwMi5jOjI5OiBUUEFTUzogRXhwZWN0OiBwYXJlbnQgSUQgKDE0MDQ4KSBkaWZmZXJzIGZyb20g
dGhyZWFkWzBdIElEICgxNDA0OSkKPj4gICAgICAgICBnZXR0aWQwMi5jOjI5OiBUUEFTUzogRXhw
ZWN0OiBwYXJlbnQgSUQgKDE0MDQ4KSBkaWZmZXJzIGZyb20gdGhyZWFkWzFdIElEICgxNDA1MCkK
Pj4gICAgICAgICBnZXR0aWQwMi5jOjI5OiBUUEFTUzogRXhwZWN0OiBwYXJlbnQgSUQgKDE0MDQ4
KSBkaWZmZXJzIGZyb20gdGhyZWFkWzJdIElEICgxNDA1MSkKPj4gICAgICAgICBnZXR0aWQwMi5j
OjI5OiBUUEFTUzogRXhwZWN0OiBwYXJlbnQgSUQgKDE0MDQ4KSBkaWZmZXJzIGZyb20gdGhyZWFk
WzNdIElEICgxNDA1MikKPj4gICAgICAgICBnZXR0aWQwMi5jOjI5OiBUUEFTUzogRXhwZWN0OiBw
YXJlbnQgSUQgKDE0MDQ4KSBkaWZmZXJzIGZyb20gdGhyZWFkWzRdIElEICgxNDA1MykKPj4gICAg
ICAgICBnZXR0aWQwMi5jOjI5OiBUUEFTUzogRXhwZWN0OiBwYXJlbnQgSUQgKDE0MDQ4KSBkaWZm
ZXJzIGZyb20gdGhyZWFkWzVdIElEICgxNDA1NCkKPj4gICAgICAgICBnZXR0aWQwMi5jOjI5OiBU
UEFTUzogRXhwZWN0OiBwYXJlbnQgSUQgKDE0MDQ4KSBkaWZmZXJzIGZyb20gdGhyZWFkWzZdIElE
ICgxNDA1NSkKPj4gICAgICAgICBnZXR0aWQwMi5jOjI5OiBUUEFTUzogRXhwZWN0OiBwYXJlbnQg
SUQgKDE0MDQ4KSBkaWZmZXJzIGZyb20gdGhyZWFkWzddIElEICgxNDA1NikKPj4gICAgICAgICBn
ZXR0aWQwMi5jOjI5OiBUUEFTUzogRXhwZWN0OiBwYXJlbnQgSUQgKDE0MDQ4KSBkaWZmZXJzIGZy
b20gdGhyZWFkWzhdIElEICgxNDA1NykKPj4gICAgICAgICBnZXR0aWQwMi5jOjI5OiBUUEFTUzog
RXhwZWN0OiBwYXJlbnQgSUQgKDE0MDQ4KSBkaWZmZXJzIGZyb20gdGhyZWFkWzldIElEICgxNDA1
OCkKPj4gICAgICAgICBnZXR0aWQwMi5jOjQ5OiBUSU5GTzogdGhyZWFkWzBdIGFuZCB0aHJlYWRb
MV0gaGF2ZSB0aGUgc2FtZSBJRAo+PiAgICAgICAgIGdldHRpZDAyLmM6NDk6IFRJTkZPOiB0aHJl
YWRbMF0gYW5kIHRocmVhZFsyXSBoYXZlIHRoZSBzYW1lIElECj4+ICAgICAgICAgZ2V0dGlkMDIu
Yzo0OTogVElORk86IHRocmVhZFswXSBhbmQgdGhyZWFkWzNdIGhhdmUgdGhlIHNhbWUgSUQKPj4g
ICAgICAgICAuLi4KPj4gd2hpY2ggaXMgY2xlYXJseSB3cm9uZywgc2luY2UgZWFjaCB0aHJlYWQg
YWJvdmUgcHJpbnRlZCBkaWZmZXJlbnQgSUQuCj4+Cj4+IFRoaXMgY29uc3RydWN0IGlzIHJhY2Ut
eSBvbiBzbG93ZXIgczM5MHggc3lzdGVtczoKPj4gICAgICAgICBmb3IgKGludCBpID0gMDsgaSA8
IFRIUkVBRFNfTlVNOyBpKyspCj4+ICAgICAgICAgICAgICAgICBTQUZFX1BUSFJFQURfQ1JFQVRF
KCZ0aHJlYWQsIE5VTEwsIHRocmVhZGVkLCAmaSk7Cj4+IGJlY2F1c2UgYnkgdGhlIHRpbWUgdGhy
ZWFkIHN0YXJ0cyBhbmQgbG9va3MgYXQgIiZpIiwgdGhlIGxvb3AgY2FuCj4+IGFscmVhZHkgbW92
ZSBvbiBhbmQgaW5jcmVtZW50ICJpIi4KPgo+Cj4gU29ycnksIGp1c3QgY29tZSB1cCBvbmUgbW9y
ZSBxdWVzdGlvbiwgcHRocmVhZF9qb2luIHdpbGwgc3RheSB0aGVyZQo+IHVudGlsIHRoZSB0aHJl
YWQgcmV2b2tlcyBmaW5pc2gsIHNvIHdoeSB0aGUgbG9vcCBjYW4gbW92ZSBvbiBhbmQgaW5jcmVh
c2UgaT8KCllvdSdyZSByaWdodCwgdGhhdCBjb21tZW50IGFwcGxpZXMgb25seSBhZnRlciBjcmVh
dGUgYW5kIGpvaW4gcnVucyBzZXBhcmF0ZWx5LgpJdCB3YXMgbWVhbnQgYXMgZXhwbGFuYXRpb24g
Zm9yIHRoZSBuZWVkIGZvciAiYXJncyIgYXJyYXkgLSBJIGNhbgpyZXdvcmQgY29tbWl0IGxvZy4K
Cj4KPgo+Pgo+Pgo+PiBBbHNvLCBwb3RlbnRpYWxseSBzdGFydGluZyBhbmQgd2FpdGluZyBmb3Ig
ZWFjaCB0aHJlYWQgY291bGQgYmUgYW4gaXNzdWUsIHNpbmNlIGtlcm5lbCBpcwo+PiBmcmVlIHRv
IHJlLXVzZSB0aWQgZm9yIGFscmVhZHkgZmluaXNoZWQgdGhyZWFkcy4KPj4KPj4gSW5zdGVhZCBv
ZiBwYXNzaW5nIHRpZCB2aWEgcHRocmVhZF9qb2luLCBqdXN0IHVzZSBhbHJlYWR5IGF2YWlsYWJs
ZSBnbG9iYWwgYXJyYXkgInRpZHMiLgo+PiBNYWtlIHN1cmUgdGhlIGFyZ3VtZW50IHRvIHB0aHJl
YWRfY3JlYXRlIGRvZXNuJ3QgY2hhbmdlLCBieSBjcmVhdGluZyBhbiBhcmdzIGFycmF5Lgo+PiBT
dGFydCBhbGwgdGhyZWFkcyBiZWZvcmUgd2Ugam9pbiBhbnkuCj4+IEFuZCBhbHNvIHByaW50IHRo
ZSB2YWx1ZSBvZiBUSUQgaW4gY2FzZXMgd2hlcmUgdGVzdCBkZXRlY3RzIHR3byB0aHJlYWRzIHVz
ZSBzYW1lIG9uZS4KPj4KPj4gU2lnbmVkLW9mZi1ieTogSmFuIFN0YW5jZWsgPGpzdGFuY2VrQHJl
ZGhhdC5jb20+Cj4+IC0tLQo+PiAgdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9nZXR0aWQvZ2V0
dGlkMDIuYyB8IDE3ICsrKysrKysrKystLS0tLS0tCj4+ICAxIGZpbGUgY2hhbmdlZCwgMTAgaW5z
ZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkKPj4KPj4gZGlmZiAtLWdpdCBhL3Rlc3RjYXNlcy9r
ZXJuZWwvc3lzY2FsbHMvZ2V0dGlkL2dldHRpZDAyLmMgYi90ZXN0Y2FzZXMva2VybmVsL3N5c2Nh
bGxzL2dldHRpZC9nZXR0aWQwMi5jCj4+IGluZGV4IDYxZjExNWZjOWU3Yy4uZWY0NDc2MWM0MWRl
IDEwMDY0NAo+PiAtLS0gYS90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL2dldHRpZC9nZXR0aWQw
Mi5jCj4+ICsrKyBiL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvZ2V0dGlkL2dldHRpZDAyLmMK
Pj4gQEAgLTE2LDcgKzE2LDcgQEAKPj4KPj4gICNkZWZpbmUgVEhSRUFEU19OVU0gMTAKPj4KPj4g
LXN0YXRpYyBwaWRfdCB0aWRzW1RIUkVBRFNfTlVNXTsKPj4gK3N0YXRpYyB2b2xhdGlsZSBwaWRf
dCB0aWRzW1RIUkVBRFNfTlVNXTsKPj4KPj4gIHN0YXRpYyB2b2lkICp0aHJlYWRlZCh2b2lkICph
cmcpCj4+ICB7Cj4+IEBAIC0yOSwyNCArMjksMjcgQEAgc3RhdGljIHZvaWQgKnRocmVhZGVkKHZv
aWQgKmFyZykKPj4gICAgICAgICBUU1RfRVhQX0VYUFIocGlkICE9IHRpZCwKPj4gICAgICAgICAg
ICAgICAgICJwYXJlbnQgSUQgKCVkKSBkaWZmZXJzIGZyb20gdGhyZWFkWyVkXSBJRCAoJWQpIiwK
Pj4gICAgICAgICAgICAgICAgIHBpZCwgaSwgdGlkKTsKPj4gLQo+PiAtICAgICAgIHJldHVybiAo
dm9pZCAqKXRzdF9zeXNjYWxsKF9fTlJfZ2V0dGlkKTsKPj4gKyAgICAgICB0aWRzW2ldID0gdGlk
Owo+PiArICAgICAgIHJldHVybiBOVUxMOwo+PiAgfQo+Pgo+PiAgc3RhdGljIHZvaWQgcnVuKHZv
aWQpCj4+ICB7Cj4+IC0gICAgICAgcHRocmVhZF90IHRocmVhZDsKPj4gKyAgICAgICBwdGhyZWFk
X3QgdGhyZWFkW1RIUkVBRFNfTlVNXTsKPj4gKyAgICAgICBpbnQgYXJnc1tUSFJFQURTX05VTV07
Cj4+ICAgICAgICAgaW50IGVycm9yID0gMDsKPj4KPj4gICAgICAgICBmb3IgKGludCBpID0gMDsg
aSA8IFRIUkVBRFNfTlVNOyBpKyspIHsKPj4gLSAgICAgICAgICAgICAgIFNBRkVfUFRIUkVBRF9D
UkVBVEUoJnRocmVhZCwgTlVMTCwgdGhyZWFkZWQsICZpKTsKPj4gLSAgICAgICAgICAgICAgIFNB
RkVfUFRIUkVBRF9KT0lOKHRocmVhZCwgKHZvaWQgKiopJnRpZHNbaV0pOwo+PiArICAgICAgICAg
ICAgICAgYXJnc1tpXSA9IGk7Cj4+ICsgICAgICAgICAgICAgICBTQUZFX1BUSFJFQURfQ1JFQVRF
KCZ0aHJlYWRbaV0sIE5VTEwsIHRocmVhZGVkLCAmYXJnc1tpXSk7Cj4+ICAgICAgICAgfQo+PiAr
ICAgICAgIGZvciAoaW50IGkgPSAwOyBpIDwgVEhSRUFEU19OVU07IGkrKykKPj4gKyAgICAgICAg
ICAgICAgIFNBRkVfUFRIUkVBRF9KT0lOKHRocmVhZFtpXSwgTlVMTCk7Cj4+Cj4+ICAgICAgICAg
Zm9yIChpbnQgaSA9IDA7IGkgPCBUSFJFQURTX05VTTsgaSsrKSB7Cj4+ICAgICAgICAgICAgICAg
ICBmb3IgKGludCBqID0gaSArIDE7IGogPCBUSFJFQURTX05VTTsgaisrKSB7Cj4+ICAgICAgICAg
ICAgICAgICAgICAgICAgIGlmICh0aWRzW2ldID09IHRpZHNbal0pIHsKPj4gLSAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICB0c3RfcmVzKFRJTkZPLCAidGhyZWFkWyVkXSBhbmQgdGhyZWFk
WyVkXSBoYXZlIHRoZSBzYW1lIElEIiwgaSwgaik7Cj4+ICsgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgdHN0X3JlcyhUSU5GTywgInRocmVhZFslZF0gYW5kIHRocmVhZFslZF0gaGF2ZSB0
aGUgc2FtZSBJRCAlZCIsIGksIGosIHRpZHNbaV0pOwo+PiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIGVycm9yID0gMTsKPj4gICAgICAgICAgICAgICAgICAgICAgICAgfQo+PiAgICAg
ICAgICAgICAgICAgfQo+PiAtLQo+PiAyLjMxLjEKPj4KPj4KPj4gLS0KPj4gTWFpbGluZyBsaXN0
IGluZm86IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlzdGluZm8vbHRwCj4+Cj4KPgo+IC0tCj4g
UmVnYXJkcywKPiBMaSBXYW5nCgoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3Rz
LmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=
