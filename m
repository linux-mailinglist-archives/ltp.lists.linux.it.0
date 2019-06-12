Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id EB4C542841
	for <lists+linux-ltp@lfdr.de>; Wed, 12 Jun 2019 15:59:34 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B63BF3EAE26
	for <lists+linux-ltp@lfdr.de>; Wed, 12 Jun 2019 15:59:34 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id BA76D3EA5C1
 for <ltp@lists.linux.it>; Wed, 12 Jun 2019 15:59:32 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 8811C200D34
 for <ltp@lists.linux.it>; Wed, 12 Jun 2019 15:59:31 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id B7C27AF9C;
 Wed, 12 Jun 2019 13:59:30 +0000 (UTC)
Date: Wed, 12 Jun 2019 15:59:30 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Jan Stancek <jstancek@redhat.com>
Message-ID: <20190612135929.GA3048@rei.lan>
References: <916c20b9a379badd37a85aa1e1339566c9807d23.1560248542.git.jstancek@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <916c20b9a379badd37a85aa1e1339566c9807d23.1560248542.git.jstancek@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Cc: liwan@redhat.com, ltp@lists.linux.it
Subject: Re: [LTP] [PATCH v2] syscalls/ioctl_ns0[156]: align stack and wait
 for child
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

SGkhCj4gVGVzdCBjcmFzaGVzIChTSUdCVVMpIHdoZW4gdXNpbmcgY2hpbGQgc3RhY2sgaGF2ZSBi
ZWVuIG9ic2VydmVkIGZvcgo+IGlvY3RsX25zMDEuIEFsaWduIHN0YWNrIHRvIDY0IGJ5dGVzIGZv
ciBhbGwgdGVzdGNhc2VzIHVzaW5nIGNsb25lLAo+IHdoaWNoIHNob3VsZCB3b3JrIGZvciBhbnkg
YXJjaC4KCkxvb2tpbmcgYXQgdGhlIHJlc3Qgb2YgdGhlIHRlc3QgaXQgc2VlbXMgdGhhdCBhbGwg
b2YgdGhlbSB1c2UgbWFsbG9jKCkKdG8gYWxsb2NhdGUgdGhlIGNoaWxkIHN0YWNrIGFuZCBkZXBl
bmRzIG9uIHRoZSBsaWJjIHRvIGFsaWduIHRoZQpidWZmZXJzLCBtYXliZSBpdCB3b3VsZCBiZSBl
YXNpZXIgdG8gY2hhbmdlIHRoZXNlIHRlc3RzIHRvIHVzZSBtYWxsb2MoKQphcyB3ZWxsLgoKPiBB
ZGQgU0lHQ0hMRCB0byBjbG9uZSBmbGFncywgc28gdGhhdCBMVFAgbGlicmFyeSBjYW4gcmVhcCBh
bGwgY2hpbGRyZW4KPiBhbmQgY2hlY2sgdGhlaXIgcmV0dXJuIGNvZGUuICBBbHNvIGNoZWNrIGx0
cF9jbG9uZSgpIHJldHVybiB2YWx1ZS4KPiAKPiBTdXBwcmVzcyB3YXJuaW5nIGZvciB1bnVzZWQg
KmFyZyBpbiBjaGlsZCgpLgoKVGhlIHJlc3QgaXMgT0suCgotLSAKQ3lyaWwgSHJ1YmlzCmNocnVi
aXNAc3VzZS5jegoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxpbnV4Lml0
L2xpc3RpbmZvL2x0cAo=
