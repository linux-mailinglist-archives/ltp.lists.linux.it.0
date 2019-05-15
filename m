Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E5121F6E6
	for <lists+linux-ltp@lfdr.de>; Wed, 15 May 2019 16:50:22 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5C50A294AC6
	for <lists+linux-ltp@lfdr.de>; Wed, 15 May 2019 16:50:22 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id BA198294AB2
 for <ltp@lists.linux.it>; Wed, 15 May 2019 16:50:21 +0200 (CEST)
Received: from mail-yw1-xc41.google.com (mail-yw1-xc41.google.com
 [IPv6:2607:f8b0:4864:20::c41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 9B5D2601F4E
 for <ltp@lists.linux.it>; Wed, 15 May 2019 16:50:16 +0200 (CEST)
Received: by mail-yw1-xc41.google.com with SMTP id w21so35380ywd.6
 for <ltp@lists.linux.it>; Wed, 15 May 2019 07:50:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=V4yIbefxISPVtq/qtaatlZhaFpYc7flJ4H4ZD7CQdWs=;
 b=huYzlEULssD72tYB95S+55EffEwg7/mxqZEFONiFnlSvB5fAxLhZUhvcUg5KfbAnK8
 Grlqbz6Gq5rsxFMJnqpA5JMbdCnE/wNyGO8q4xQQMWyFRce7R5WP6AGrj0mdAPqbl7nJ
 HORuPwtm/Kbcfyd+7DVDA6QX0UwEG1mkscWHkZnfhPrg6LunpSvR2ZAaf1oRzWubDBkt
 RPxCgEyNjn0YnMIiOrvZ9vbbGcLEdYyQaz4ra7j8XspMshhgWiHegYcECBsGVvItU5u/
 98HsXKUQEwYAsvs8pk1tVIXctOKOzdwv7Fv4deVjfJ94Wy8tqp9oU9litALpkQuplra5
 Ehqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=V4yIbefxISPVtq/qtaatlZhaFpYc7flJ4H4ZD7CQdWs=;
 b=n2YDAta3gwE4SE6PZnSt6yGX+ixMS2tiBsi5y/r+9PaU+f4FfUraHV/X4Qgaj6t3o6
 M/1gbqRBVIxfPAPdKGi1c6Wt98ENP34iR7ZhyuuHBRSmF7/JjfRHcd8S7cP7mFYJb1xz
 1uKRi+fAFp5iThwycAcx1s2/w5OwFlSzh0xeJH+kl5rWAVhJ7LrqN3jPtlsKeAUKtzYX
 hUNoujGL0DvOrzwF4KxTt4ZCO9V249cf2E6ZSX7au2LrK56qdjEs2U0bCvZ+7HaoeRS5
 rHPObWnHZnNcrxHC/Kju2EJBp1csDibNNB7ItTGaHhsTYBqvdDb6GUcpA8Y5DOuQr9d8
 vl1g==
X-Gm-Message-State: APjAAAWiMO+xf4YcJ6QGb56OELi/DU7QuSOzdhJi0Lga/nS4TDqYezMM
 jkF+UABQ38NvxywruW/f6qZP7W4LHJJczgBj7FesmFg+
X-Google-Smtp-Source: APXvYqzNuTZUrqa6rs6a+qQxEiLBmjF/1TSatQxlg1MPmZacaD8LZl6vwtmCglyqYgBp1gmCHKzMpc75wurG2lFV104=
X-Received: by 2002:a81:7dc5:: with SMTP id y188mr19512890ywc.34.1557931814361; 
 Wed, 15 May 2019 07:50:14 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1555763787.git.mbobrowski@mbobrowski.org>
 <6639dd7a9ff9929ce79f4f353f3e1db075594ea2.1555763787.git.mbobrowski@mbobrowski.org>
 <20190426152748.GA31769@rei.lan>
 <20190427045341.GA3894@lithium.mbobrowski.org>
In-Reply-To: <20190427045341.GA3894@lithium.mbobrowski.org>
From: Amir Goldstein <amir73il@gmail.com>
Date: Wed, 15 May 2019 17:50:03 +0300
Message-ID: <CAOQ4uxh7Ea02UyWeZKP5jJxhHkiTNpChH_H3=bFLNnZG4SU7-g@mail.gmail.com>
To: Matthew Bobrowski <mbobrowski@mbobrowski.org>
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Cc: Jan Kara <jack@suse.cz>, ltp@lists.linux.it
Subject: Re: [LTP] [PATCH v2 1/3] syscalls/fanotify13: new test to verify
 FAN_REPORT_FID functionality
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

T24gU2F0LCBBcHIgMjcsIDIwMTkgYXQgNzo1MyBBTSBNYXR0aGV3IEJvYnJvd3NraQo8bWJvYnJv
d3NraUBtYm9icm93c2tpLm9yZz4gd3JvdGU6Cj4KPiBPbiBGcmksIEFwciAyNiwgMjAxOSBhdCAw
NToyNzo0OFBNICswMjAwLCBDeXJpbCBIcnViaXMgd3JvdGU6Cj4gPiBIaSEKPiA+IEkndmUgdHJp
ZWQgdGhlc2UgdGVzdHMgb24gYnVpbGRzZXJ2aWNlIHRvIGNoZWNrIHRoYXQgdGhlcmUgYXJlIG5v
Cj4gPiBwcm9ibGVtcyBvbiBzbGlnaHRseSBvbGRlciBkaXN0cmlidXRpb25zIGFuZCBmb3VuZCB0
d28uCj4gPgo+ID4gVGhlIGZpcnN0IG9uZSBpcyB0aGF0IHdlIGRvIGRlZmluZSBmYWxsYmFjayBk
ZWZpbml0aW9ucyBpbiBmYW5vdGlmeS5oCj4gPiBidXQgdGhlbiBpZmRlZiB0aGUgd2hvbGUgdGVz
dCBjb2RlIGluICNpZiBkZWZpbmVkKEhBVkVfU1lTX0ZBTk9USUZZX0gpCj4gPiBzbyB0aGF0IGl0
J3MgZWZlY3RpdmVseSBkaXNhYmxlZCBvbiBvbGRlciBkaXN0cm9zIGV2ZW4gd2l0aCBmYWxsYmFj
awo+ID4gZGVmaW5pdGlvbnMgaW4gcGxhY2UuIEFsc28gaXQncyBUU1RfVEVTVF9UQ09ORigpIGJ1
dCB0aGF0IGlzIGp1c3QgZWFzeQo+ID4gdG8gZml4IHR5cG8uIEkgZ3Vlc3MgdGhhdCB3ZSBjYW4g
cmVtb3ZlIHRoZSBpZmRlZiBhbmQgc3lzL2Zhbm90aWZ5LmgKPiA+IGluY2x1ZGUgZnJvbSB0aGUg
dGVzdCBzb3VyY2VzIHNpbmNlIHdlIGNvbmRpdGlvbmFsbHkgaW5jbHVkZSB0aGUKPiA+IHN5cy9m
YW5vdGlmeS5oIGluIHRoZSBsb2NhbCBmYW5vdGlmeS5oIGFscmVhZHkuCj4KPiBPSy4gSW4gdGhh
dCBjYXNlIEkgY2FuIHdyaXRlIGEgcGF0Y2ggdGhhdCBpcyB0byBiZSBhcHBsaWVkIHByaW9yIHRv
IHRoaXMgc2VyaWVzCj4gd2hpY2ggZXNzZW50aWFsbHkganVzdCByZW1vdmVzIHRoaXMgc3BlY2lm
aWMgcHJlcHJvY2Vzc29yIGNvbmRpdGlvbmFsIGRpcmVjdGl2ZQo+IGZyb20gYWxsIHRoZSBzb3Vy
Y2UgZmlsZXMuIFdvdWxkIHlvdSBsaWtlIG1lIHRvIGRvIHRoaXM/CgpJZiBJIHVuZGVyc3RhbmQg
dGhlIGNvbmNlcm4gY29ycmVjdGx5LCBpdCBpcyBub3QgcmVhbGx5IGltcG9ydGFudAp0byBhZGRy
ZXNzIG5vdyBmb3IgdGhlc2UgbmV3IHRlc3RzIHRoYXQgY2hlY2sgZnVuY3Rpb25hbGl0eSBvbmx5
IGF2YWlsYWJsZQpzaW5jZSBrZXJuZWwgdjUuMS4gSXQgY291bGQgYmUgYWRkcmVzc2VkIGJ5IGZv
bGxvd3VwIHdvcmsuCgo+Cj4gPiBUaGUgc2Vjb25kIG9uZSBpcyB0aGF0IHdlIGZhaWwgdG8gY29t
cGlsZSBvbiBvbGRlciBkaXN0cmlidXRpb25zIGJlY2F1c2UKPiA+IG9mIG1pc3NpbmcgbmFtZV90
b19oYW5kbGVfYXQoKSBzbyB3ZSBuZWVkIGNvbmZpZ3VyZSBjaGVjayBmb3IgdGhhdAo+ID4gc3lz
Y2FsbCBhbmQgZmFsbGJhY2sgZGVmaW5pdGlvbiBpbiBsYXBpLyBoZWFkZXIsIG9yIGF0IGxlYXN0
IGNvbmZpZ3VyZQo+ID4gY2hlY2sgYW5kIGlmZGVmIGluIHRoZSBmYW5vdGlmeV9nZXRfZmlkKCkg
ZnVuY3Rpb24uIFdoaWNoIHNob3VsZCBiZSBhcwo+ID4gZWFzeSBhcyBhZGRpbmcgYSBuYW1lX3Rv
X2hhbmRsZV9hdCBsaW5lIHRvIEFDX0NIRUNLX0ZVTkNTKCkgaW4gdGhlCj4gPiBjb25maWd1cmUu
YWMgYW5kIHVzaW5nIHRoZSBtYWNybyBmcm9tIGNvbmZpZy5oLgo+Cj4gU3VyZS4gSSd2ZSBnb25l
IGFoZWFkIGFuIHVwZGF0ZWQgaXQgdG8gYWNjb21tb2RhdGUgZm9yIHRoaXMuIFByaW9yIHRvCj4g
c3VibWl0dGluZyB0aHJvdWdoIGFub3RoZXIgcGF0Y2hlcyBzZXJpZXMsIGNoYW5nZXMgY2FuIGJl
IGZvdW5kIGhlcmU6Cj4gaHR0cHM6Ly9naXRodWIuY29tL21hdHRoZXdib2Jyb3dza2kvbHRwL2Nv
bW1pdC81NDI2NGRiMGU1NzRkMmY5MGU3MTZhNTEwZmNiMWRhMTFlZTE3NGRjLgo+Cj4gSSB0aGlu
ayB3ZSBjYW4gZG8gYmV0dGVyIGFuZCBhbHNvIHByb3ZpZGUgYSBmYWxsYmFjayBkZWZpbml0aW9u
IHRob3VnaCwKPiB0aG91Z2h0cz8gRG9uJ3QgYmVsaWV2ZSB0aGF0IGl0IHdvdWxkIHRha2UgbXVj
aCBlZmZvcnQuCj4KCk5vIHJlYXNvbiB0byBkbyB0aGF0LiBUaG9zZSB0ZXN0cyB3aWxsIG9ubHkg
YmUgc3VwcG9ydGVkIG9uIGtlcm5lbCA+PSB2NS4xCm9sZCBkaXN0cm9zIGFyZSBsZXNzIGludGVy
ZXN0aW5nIGZvciB0aGVzZSB0ZXN0cy4KClBsZWFzZSBwb3N0IHRoZSBwYXRjaGVzIGZvciAgZmFu
b3RpZnlfZGlyZW50XzMgYnJhbmNoLgoKVGhhbmtzLApBbWlyLgoKLS0gCk1haWxpbmcgbGlzdCBp
bmZvOiBodHRwczovL2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=
