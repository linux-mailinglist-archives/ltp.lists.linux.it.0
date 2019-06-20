Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id C228B4D09A
	for <lists+linux-ltp@lfdr.de>; Thu, 20 Jun 2019 16:43:52 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1FC143EAB0A
	for <lists+linux-ltp@lfdr.de>; Thu, 20 Jun 2019 16:43:52 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 1BCD03EA9D3
 for <ltp@lists.linux.it>; Thu, 20 Jun 2019 16:43:48 +0200 (CEST)
Received: from mail-yb1-xb43.google.com (mail-yb1-xb43.google.com
 [IPv6:2607:f8b0:4864:20::b43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 462401400DA6
 for <ltp@lists.linux.it>; Thu, 20 Jun 2019 16:43:48 +0200 (CEST)
Received: by mail-yb1-xb43.google.com with SMTP id i6so1328524ybq.6
 for <ltp@lists.linux.it>; Thu, 20 Jun 2019 07:43:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=72oUZjUlb8hoaN4zpLR2/vvkaZD2uAByNGu6jdRw8QA=;
 b=GXihU3OVA53FYqtEV5ywaSnjTe1kAnaVJHLS88K7rOWWWjJq5pXyI/AFi+rmzmqwZ6
 pjRVIxDzgAc8KFMdF+JI3b0xTxqNTIuL0fdbfLKrCdujgwbxeMIA0c70bXhjFHw87ruz
 ZPczxvtxYg3T7zEFrT406+yw7eCYiUPI2nfWfUzmgbFGkpDrnxUP2OzFJ2UjSEbgsEdh
 pZCUJq6TGng7k2FIaroPHDu/sPCbzjD9U50f8MEwFemTyGVsWYohTIx30Jq/LVBRLJFF
 K2BVA0UbXUPkDPHqSk1JAtZfs0nF94B72L7OLeCndD2E9gg9IsBDq7dql3ixHgVikCBe
 8hMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=72oUZjUlb8hoaN4zpLR2/vvkaZD2uAByNGu6jdRw8QA=;
 b=aN01pZzPug5DYmrmW/3aHu4+IDNAE6IcUwCTou3lpf11A2LSe0RttMhMSF5T0eikiI
 M9j8ynJnBjyM4oYFzGP+fjimdblwm9w/wGxHnT+af6Y0UZfQ4m+8h9RVdF60IhzFKDSN
 5SwewWJuZmYmNUOI2K7giYSuSbBjSayNpHh/VvbkPJHCUlTw7pDigamvlUY+SLtp8hta
 2uXXBQ9rGXkbcwqfExlycaQh5YtO1Obo3E1iKhwysx8t+geiYK98t6ezGMw9O2lI1KgP
 8SJEBECkIhBJzO9TzScnuBsesxlEMesoyGpX+hZeqibHnY/AnQdrnFWH/VB8uy9jzkNy
 TM4w==
X-Gm-Message-State: APjAAAVmePsLn1rZjJdjQjR2ZWIqarq0r0SL6hSZa+hw7A+e6MAmM3vQ
 VRd663EEcvXpO/btsz2d0CQFsj5tq5uqa9kLSkE=
X-Google-Smtp-Source: APXvYqyVMXQhPlXI7m5czL1exZ0PXzIlcs8931jROZ0gbwKe4pJBBjNNDGUheCjnyhbjxtXiZl4LTSZ0S9dUzDAZbsg=
X-Received: by 2002:a25:b202:: with SMTP id i2mr63816670ybj.439.1561041827069; 
 Thu, 20 Jun 2019 07:43:47 -0700 (PDT)
MIME-Version: 1.0
References: <20190322133228.18901-1-camann@suse.com>
 <20190325101404.GA20297@dell5510>
In-Reply-To: <20190325101404.GA20297@dell5510>
From: Amir Goldstein <amir73il@gmail.com>
Date: Thu, 20 Jun 2019 17:43:35 +0300
Message-ID: <CAOQ4uxhT_BwUA=3sFdhdKfYhMeBqMPwe1sHvXR5jLaDu8u+2zQ@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Cc: LTP List <ltp@lists.linux.it>
Subject: Re: [LTP] [PATCH v2] syscalls/ioctl08: add file deduplication
	testcases
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

T24gTW9uLCBNYXIgMjUsIDIwMTkgYXQgMTI6MTQgUE0gUGV0ciBWb3JlbCA8cHZvcmVsQHN1c2Uu
Y3o+IHdyb3RlOgo+Cj4gSGkgQ2hyaXN0aWFuLAo+Cj4gPiBUaGlzIGFkZHMgdGVzdHMgZm9yIHRo
ZSBpb2N0bCByZXF1ZXN0IEZJREVEVVBFUkFOR0UKPiA+IG9uIGEgYnRyZnMgZGV2aWNlLgo+Cj4g
PiBUaGVzZSB0ZXN0cyBzZXQgdGhlIGNvbnRlbnRzIG9mIHR3byBmaWxlcywgYW5kIGNoZWNrcwo+
ID4gaWYgdGhlIGZvbGxvd2luZyBlbnRpdGllcyBhcmUgc2V0IGNvcnJlY3RseSBhZnRlcgo+ID4g
dGhlIGlvY3RsIGNhbGw6Cj4KPiA+IC0gZXJybm8gKHNldCBieSBpb2N0bCkKPiA+IC0gbnVtYmVy
IG9mIGRlZHVwbGljYXRlZCBieXRlcwo+ID4gLSBzdGF0dXMgZmllbGQgb2YgdGhlIGZpbGVfZGVk
dXBlX3JhbmdlX2luZm8gc3RydWN0Cj4KPiAuLi4KPiA+ICsrKyBiL3Rlc3RjYXNlcy9rZXJuZWwv
c3lzY2FsbHMvaW9jdGwvaW9jdGwwOC5jCj4gPiBAQCAtMCwwICsxLDEzMSBAQAo+ID4gKy8vIFNQ
RFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9yLWxhdGVyCj4gPiArLyoKPiA+ICsgKiBD
b3B5cmlnaHQgKGMpIDIwMTkgU1VTRSBMTEMKPiA+ICsgKiBBdXRob3I6IENocmlzdGlhbiBBbWFu
biA8Y2FtYW5uQHN1c2UuY29tPgo+ID4gKyAqCj4gPiArICovCj4gPiArCj4gPiArLyoKPiA+ICsg
KiBUZXN0cyB0aGUgaW9jdGwgZnVuY3Rpb25hbGl0eSB0byBkZWR1cGxpY2F0ZSBmaWxlcmFuZ2Vz
IHVzaW5nCj4gPiArICogYnRyZnMgZmlsZXN5c3RlbS4KPiA+ICsgKgo+ID4gKyAqIDEpICAgICAg
ICBTZXRzIHRoZSBzYW1lIGNvbnRlbnRzIGZvciB0d28gZmlsZXMgYW5kIGRlZHVwbGljYXRlcyBp
dC4KPiA+ICsgKiAgIERlZHVwbGljYXRlcyAzIGJ5dGVzIGFuZCBzZXQgdGhlIHN0YXR1cyB0bwo+
ID4gKyAqICAgRklMRV9ERURVUEVfUkFOR0VfU0FNRS4KPiA+ICsgKiAyKSAgICAgICAgU2V0cyBk
aWZmZXJlbnQgY29udGVudCBmb3IgdHdvIGZpbGVzIGFuZCB0cmllcyB0bwo+ID4gKyAqICAgZGVk
dXBsaWNhdGUgaXQuIDAgYnl0ZXMgZ2V0IGRlZHVwbGljYXRlZCBhbmQgc3RhdHVzIGlzCj4gPiAr
ICogICBzZXQgdG8gRklMRV9ERURVUEVfUkFOR0VfRElGRkVSUy4KPiA+ICsgKiAzKSAgICAgICAg
U2V0cyBzYW1lIGNvbnRlbnQgZm9yIHR3byBmaWxlcyBidXQgc2V0cyB0aGUgbGVuZ3RoIHRvCj4g
PiArICogICBkZWR1cGxpY2F0ZSB0byAtMS4gaW9jdGwoRklERURVUEVSQU5HRSkgZmFpbHMgd2l0
aCBFSU5WQUwuCj4gPiArICovCj4gPiArCj4gTEdUTSwgZ29pbmcgdG8gYXBwbHkgaXQgd2l0aCBh
ZGRpbmcKPiAjaW5jbHVkZSAiY29uZmlnLmgiIGhlcmUgKHRoYXQncyBuZWVkZWQgZm9yIGRldGVj
dGluZyBIQVZFX1NUUlVDVF9GSUxFX0RFRFVQRV9SQU5HRQoKCkZZSSwgVGhpcyB0ZXN0IGZhaWxz
IG9uIGtlcm5lbCB3aXRob3V0IGJ0cmZzIHN1cHBvcnQuCgpXQVJOSU5HOiBmYWlsZWQgdG8gb3Bl
biAvZGV2L2J0cmZzLWNvbnRyb2wsIHNraXBwaW5nIGRldmljZQpyZWdpc3RyYXRpb246IE5vIHN1
Y2ggZmlsZSBvciBkaXJlY3RvcnkKc2FmZV9tYWNyb3MuYzo3NTc6IEJST0s6IHRzdF90ZXN0LmM6
NzUyOiBtb3VudCgvZGV2L2xvb3AwLCBtbnRfcG9pbnQsCmJ0cmZzLCAwLCAobmlsKSkgZmFpbGVk
OiBFTk9ERVYKClRoYW5rcywKQW1pci4KCi0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9s
aXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAK
