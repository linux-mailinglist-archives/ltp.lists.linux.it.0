Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id BFAA724E4F
	for <lists+linux-ltp@lfdr.de>; Tue, 21 May 2019 13:48:57 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 88E893EA78B
	for <lists+linux-ltp@lfdr.de>; Tue, 21 May 2019 13:48:57 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 128CE3EA711
 for <ltp@lists.linux.it>; Tue, 21 May 2019 13:48:55 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 872A26001FA
 for <ltp@lists.linux.it>; Tue, 21 May 2019 13:48:54 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id D0126AF3E;
 Tue, 21 May 2019 11:48:53 +0000 (UTC)
Date: Tue, 21 May 2019 13:48:53 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Sandeep Patil <sspatil@android.com>
Message-ID: <20190521114853.GD13910@rei>
References: <20190520041730.28238-1-sspatil@android.com>
 <20190520094949.GA25405@rei.lan> <20190521044148.GC7753@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190521044148.GC7753@google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Cc: chrubis@suze.cz, kernel-team@android.com, ltp@lists.linux.it
Subject: Re: [LTP] [RFC PATCH 0/1] Fix return value checks for posix apis
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

SGkhCj4gPiA+IFBBVENIIDEvMSBkZW1vbnN0cmF0ZXMgdGhlIGZpeGVzIG5lZWRlZCBmb3IgcHRo
cmVhZF9zaWdtYXNrLzYtMSBmb3IKPiA+ID4gZXhhbXBsZS4gVGhpcyBwYXR0ZXJuIGlzIGZhaXJs
eSB3aWRlc3ByZWFkIGluIG9wZW5fcG9zaXhfdGVzdHN1aXRlLgo+ID4gPiAKPiA+ID4gQWZ0ZXIg
Z29pbmcgdGhyb3VnaCB0aGUgZG9jdW1lbnRhdGlvbiBpbiB0aGUgcHJvamVjdCwgSSB3YXNuJ3Qg
c3VyZSBpZiBJCj4gPiA+IHRlc3RlZCB0aGlzIGNvcnJlY3RseS4gQWZ0ZXIgYnVpbGRpbmcsIEkg
dHJpZWQgdGhlIGZvbGxvd2luZwo+ID4gPiAKPiA+ID4gJCBjZCB0ZXN0Y2FzZXMvb3Blbl9wb3Np
eF90ZXN0c3VpdGUKPiA+ID4gJCAuL2Jpbi9ydW5fdGVzaXQuc2ggY29uZm9ybWFuY2UvaW50ZXJm
YWNlcy9wdGhyZWFkX3NpZ21hc2sgcHRocmVhZF9zaWdtYXNrXzYtMS5ydW4tdGVzdAo+ID4gPiAK
PiA+ID4gLi4uYW5kIHRoYXQga2VlcHMgcnVubmluZyBpbnRvIHRlc3QgYmVpbmcgc2tpcHBlZCBk
dWUgdG8gbWlzc2luZyBmaWxlLgo+ID4gPiAoSSBkbyBoYXZlIHB0aHJlYWRfc2lnbWFza182LTEu
cnVuLXRlc3QgaW4gcGxhY2UpLgo+ID4gCj4gPiBBY3R1YWxseSBJIGFsd2F5cyBqdXN0IHJ1biB0
aGUgYmluYXJ5LCBzbyBpbiB0aGlzIGNhc2UgZG9pbmcKPiA+IC4vcHRocmVhZF9zaWdtYXNrXzYt
MS5ydW4tdGVzdCBzaG91bGQgc3VmZmljZS4KPiAKPiBPaywgSSdsbCB0cnkgdGhhdCwgYnV0IElJ
UkMgaXQgZGlkIG5vdGhpbmcgb24gbXkgbGFwdG9wLiBJJ2xsIHJldHJ5LgoKTG9va3MgbGlrZSB0
aGUgdGVzdCBkb2VzIG5vdCBwcmludCBhbnl0aGluZyB1bmxlc3MgdGhlcmUgaXMgYSBmYWlsdXJl
LgoKV2VsbCB0aGUgY29udmVudGlvbiBpbiBvcGVucG9zaXggdGVzdHN1aXRlIEkgc3RhcnRlZCB0
byBmb2xsb3cgaXMgdG8KcHJpbnQgIlRlc3QgUEFTU0VEIiBpbiBzdWNoIGNhc2UsIHNvIHRoaXMg
c2hvdWxkIGJlIGZpeGVkIChpbiBhCnNlcGFyYXRlIHBhdGNoKSBhcyB3ZWxsLgoKLS0gCkN5cmls
IEhydWJpcwpjaHJ1YmlzQHN1c2UuY3oKCi0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9s
aXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAK
