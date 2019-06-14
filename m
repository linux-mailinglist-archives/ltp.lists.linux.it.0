Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 748B6462A3
	for <lists+linux-ltp@lfdr.de>; Fri, 14 Jun 2019 17:24:35 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 38CA93EA6D1
	for <lists+linux-ltp@lfdr.de>; Fri, 14 Jun 2019 17:24:35 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 633E43EA5BC
 for <ltp@lists.linux.it>; Fri, 14 Jun 2019 17:24:32 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id C4B861A01CCD
 for <ltp@lists.linux.it>; Fri, 14 Jun 2019 17:24:31 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 57FC5AD5E;
 Fri, 14 Jun 2019 15:24:30 +0000 (UTC)
Date: Fri, 14 Jun 2019 17:24:28 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Li Wang <liwang@redhat.com>
Message-ID: <20190614152428.GA12655@rei.lan>
References: <adca7c08dbf20805da9b99a7fa03d498de70235d.1560410182.git.jstancek@redhat.com>
 <fd8b05453a0c72f2810a53e49ca1dc9467d9dbf9.1560410182.git.jstancek@redhat.com>
 <CAEemH2f_oMYubEDLdOmhxrEguKkc+3smx682LF7D9uiwZ26OAQ@mail.gmail.com>
 <20190613135740.GB29926@rei.lan>
 <CAEemH2e7yfW3fd2kRFh-6tq8Y+sZeBvSB4Eu4JN6Htdo4_=K5g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEemH2e7yfW3fd2kRFh-6tq8Y+sZeBvSB4Eu4JN6Htdo4_=K5g@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Cc: LTP List <ltp@lists.linux.it>
Subject: Re: [LTP] [PATCH v3 2/3] lib: rename ltp_clone_malloc to
 ltp_clone_alloc
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

SGkhCj4gPiBXZWxsLCB3ZSBjYW4gZnJlZSB0aGUgbWVtb3J5IGluIGx0cF9jbG9uZV9hbGxvYygp
IGlmIHRoZSBjaGlsZCBydW5zIGluIGEKPiA+IHNlcGFyYXRlIG1lbW9yeSBzcGFjZSwgYnV0IGlm
IENMT05FX1ZNIHdhcyBwYXNzZWQgaW4gZmxhZ3MgdGhlcmUgaXMgbm8KPiA+IHdheSBob3cgdG8g
ZnJlZSB0aGUgbWVtb3J5Li4uCj4gPgo+IAo+IEEgc3R1cGlkIHdheSBjb21lIHVwIHRvIG15IG1p
bmQgaXMganVzdCB0byBleHBvcnQgdGhlIHN0YWNrIGFzIGdsb2JhbAo+IHBvaW50ZXIgYW5kIHJl
bGVhc2luZyBpbiBkb19jbGVhbnVwKCkgaWYgcG9zc2libGUuCgpUaGlzIG9ubHkgd29ya3MgaWYg
eW91IGNhbGwgdGhlIGZ1bmN0aW9uIG9ubHkgb25jZSwgaWYgeW91IGNsb25lIHR3byBvcgptb3Jl
IHlvdSBlbmQgdXAgaW4gdGhlIHZlcnkgc2FtZSBzaXR1YXRpb24gYXMgYmVmb3JlLgoKQWxzbyB3
ZSB3aWxsIGhhdmUgdG8gZmlndXJlIG91dCBzaW1pbGFyIHByb2JsZW0gYXMgYSBwYXJ0IG9mCmh0
dHBzOi8vZ2l0aHViLmNvbS9saW51eC10ZXN0LXByb2plY3QvbHRwL2lzc3Vlcy81MzEgYW55d2F5
cywgc28gSQp3b3VsZG4ndCBib3RoZXIgYXQgdGhpcyBwb2ludC4KCi0tIApDeXJpbCBIcnViaXMK
Y2hydWJpc0BzdXNlLmN6CgotLSAKTWFpbGluZyBsaXN0IGluZm86IGh0dHBzOi8vbGlzdHMubGlu
dXguaXQvbGlzdGluZm8vbHRwCg==
