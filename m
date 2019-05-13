Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id BE5BD1C70E
	for <lists+linux-ltp@lfdr.de>; Tue, 14 May 2019 12:34:05 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 995043EA365
	for <lists+linux-ltp@lfdr.de>; Tue, 14 May 2019 12:34:05 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 76EF5294A6E
 for <ltp@lists.linux.it>; Mon, 13 May 2019 22:13:53 +0200 (CEST)
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 94A161000B31
 for <ltp@lists.linux.it>; Mon, 13 May 2019 22:13:49 +0200 (CEST)
Received: by mail-pl1-x62a.google.com with SMTP id a5so7006346pls.12
 for <ltp@lists.linux.it>; Mon, 13 May 2019 13:13:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=boi9NL6iSAzONGdXr76d7hDZm3DbVMV/BBfhBy+eMyM=;
 b=qzytrqHk7QCh/U9d0ETDI+K7oPTN3GhrHJ517iEujR4is77IJp32YBwi0iyc5O1RJe
 vNESXeKnm2bzchZwNsFLD8FmNCw7loCoJmhZLBzWwk+2+mpfSh+52BlgM+CNk11uWJBZ
 Ky/XiS52I4wT8latd2iJIv9mOHhoe/PflgTqg0DDzc7oqIQtGTBD7RzS21Ej6KJL8LHI
 phXt5MAfER28l6VQJ8P2VAzYrEZWUSf9MRI3zGrUUkslYPZ5TvCxJqP188nc2ezbmM2G
 IsnasKJq1yqFTzM9MOue8L2RFgcTmVC/iOZp7PUNRC8nu1l4O6maRfjMe65LT+z4+Kbq
 oEmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=boi9NL6iSAzONGdXr76d7hDZm3DbVMV/BBfhBy+eMyM=;
 b=NadeRnoehqV2koagggE5hchl6BuHQmMBW8ztv3UK3hX4Zebt8I8gjdAPpkxsIKjygT
 MRjsaBXJ77tpPtP2Hj7yxfmsXsu54svDibgSBFuZOLHzQULTwhjO+oUNZ1wPDKVF+VA9
 HMUYeVNEPa/BoPL0viXkwBKeqJbf3rxMeyAHXTWK9Xveen0lW2rcT4thbSktaHHM7m0x
 Vx5JZb/RjypArtPjBwjY6rbj6lBgKlM2z82qst5h7ba1vZTA/+Wj4T01eCW43r6kzICT
 TPAxN9VyfAcahvgBGedExWZZBk/YrdaS1KXTN8s0WJzDGgVJ0n+W2MGP7moB6ToEZ2D5
 9AyQ==
X-Gm-Message-State: APjAAAWzgda8liNXD/XXxtAHBlmURGHi/2OIym6o8KaCJutVuMdRuJ9W
 sN0e7F2cq+BEAGk07b7+OH9Ep1fGmIjrcBPZ19A=
X-Google-Smtp-Source: APXvYqxHMpNg7SQWZb67+kg1AXSqM4Ax1NS8i5mu0NhvE4EeMpMiv6wjhS3S3385eP0HeFCQj93U5BocjkvJkIChXz4=
X-Received: by 2002:a17:902:2beb:: with SMTP id
 l98mr31528634plb.290.1557778430736; 
 Mon, 13 May 2019 13:13:50 -0700 (PDT)
MIME-Version: 1.0
References: <20190510043845.4977-1-xzhou@redhat.com>
 <20190513143413.GA4568@dell5510>
In-Reply-To: <20190513143413.GA4568@dell5510>
From: Steve French <smfrench@gmail.com>
Date: Mon, 13 May 2019 15:13:39 -0500
Message-ID: <CAH2r5mvSS4crgid-srKr+hycN=uW-vPLGhF81RvA6UBP2T7K4A@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
X-Mailman-Approved-At: Tue, 14 May 2019 12:34:01 +0200
Cc: CIFS <linux-cifs@vger.kernel.org>, ltp@lists.linux.it
Subject: Re: [LTP] [PATCH] safe_setuid: skip if testing on CIFS
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

QWxzbyBub3RlIHRoYXQgd2UgYXJlIHdvcmtpbmcgb24gcGF0Y2hlcyB0byBpbXByb3ZlIHNhdmlu
ZyBvZiBtb2RlCmJpdHMgYW5kIG93bmVyc2hpcCBpbmZvcm1hdGlvbiBldmVuIGluIGNhc2VzIHdo
ZXJlIHRoZSBzZXJ2ZXIgZG9lcyBub3QKc3VwcG9ydCBQT1NJWCBFeHRlbnNpb25zLgoKQ3VycmVu
dGx5IG1vdW50IG9wdGlvbnMgY2lmc2FjbCBhbmQgaWRzZnJvbXNpZCBjYW4gYmUgdXNlZCBmb3Ig
c29tZQp1c2UgY2FzZXMgYnV0IHRoZXkgYXJlIGJlaW5nIGV4dGVuZGVkLgoKT24gTW9uLCBNYXkg
MTMsIDIwMTkgYXQgMTE6MDQgQU0gUGV0ciBWb3JlbCA8cHZvcmVsQHN1c2UuY3o+IHdyb3RlOgo+
Cj4gSGkgTXVycGh5LAo+Cj4gPiBBcyBDSUZTIGlzIG5vdCBzdXBwb3J0aW5nIHNldHVpZCBvcGVy
YXRpb25zLgo+IEFueSByZWZlcmVuY2UgdG8gdGhpcz8KPiBmcy9jaWZzL2NpZnNmcy5jIGFuZCBv
dGhlciBwYXJ0cyBvZiBrZXJuZWwgY2lmcyB3b3JrcyB3aXRoIENJRlNfTU9VTlRfU0VUX1VJRC4K
PiBBbHNvIHNhbWJhX3NldHJldWlkKCkgZnJvbSBsaWIvdXRpbC9zZXRpZC5jIGZyb20gc2FtYmEg
Z2l0IChJIGd1ZXNzIHVzZWQgaW4KPiBzYW1iYSBsaWJyYXJpZXMgd29ya3Mgd2l0aCBTWVNfc2V0
cmV1aWQgc3lzY2FsbCBvciBzZXRyZXVpZCgpIGxpYmMgd3JhcHBlci4KPiBXaGF0IGFtIEkgbWlz
c2luZz8KPgo+ID4gZGlmZiAtLWdpdCBhL2xpYi90c3Rfc2FmZV9tYWNyb3MuYyBiL2xpYi90c3Rf
c2FmZV9tYWNyb3MuYwo+ID4gaW5kZXggMGU1OWEzZjk4Li4zNjk0MWVjMGIgMTAwNjQ0Cj4gPiAt
LS0gYS9saWIvdHN0X3NhZmVfbWFjcm9zLmMKPiA+ICsrKyBiL2xpYi90c3Rfc2FmZV9tYWNyb3Mu
Ywo+ID4gQEAgLTExMSw2ICsxMTEsNyBAQCBpbnQgc2FmZV9zZXRyZXVpZChjb25zdCBjaGFyICpm
aWxlLCBjb25zdCBpbnQgbGluZW5vLAo+ID4gICAgICAgICAgICAgICAgIHVpZF90IHJ1aWQsIHVp
ZF90IGV1aWQpCj4gPiAgewo+ID4gICAgICAgaW50IHJ2YWw7Cj4gPiArICAgICBsb25nIGZzX3R5
cGU7Cj4KPiA+ICAgICAgIHJ2YWwgPSBzZXRyZXVpZChydWlkLCBldWlkKTsKPiA+ICAgICAgIGlm
IChydmFsID09IC0xKSB7Cj4gPiBAQCAtMTE5LDYgKzEyMCwxMyBAQCBpbnQgc2FmZV9zZXRyZXVp
ZChjb25zdCBjaGFyICpmaWxlLCBjb25zdCBpbnQgbGluZW5vLAo+ID4gICAgICAgICAgICAgICAg
ICAgICAgICAobG9uZylydWlkLCAobG9uZylldWlkKTsKPiA+ICAgICAgIH0KPgo+ID4gKyAgICAg
ZnNfdHlwZSA9IHRzdF9mc190eXBlKCIuIik7Cj4gPiArICAgICBpZiAoZnNfdHlwZSA9PSBUU1Rf
Q0lGU19NQUdJQykgewo+ID4gKyAgICAgICAgICAgICB0c3RfYnJrXyhmaWxlLCBsaW5lbm8sIFRD
T05GLAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAic2V0cmV1aWQgaXMgbm90IHN1cHBvcnRl
ZCBvbiAlcyBmaWxlc3lzdGVtIiwKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgdHN0X2ZzX3R5
cGVfbmFtZShmc190eXBlKSk7Cj4gPiArICAgICB9Cj4gSSBndWVzcyB0aGlzIGNoZWNrIHNob3Vs
ZCBiZSBiZWZvcmUgc2V0cmV1aWQoKSBBcyBpdCdzIGluIHNhZmVfc2V0ZXVpZCgpIGFuZAo+IHNh
ZmVfc2V0dWlkKCkKPiA+ICsKPiA+ICAgICAgIHJldHVybiBydmFsOwo+ID4gIH0KPgo+IEtpbmQg
cmVnYXJkcywKPiBQZXRyCgoKCi0tIApUaGFua3MsCgpTdGV2ZQoKLS0gCk1haWxpbmcgbGlzdCBp
bmZvOiBodHRwczovL2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=
