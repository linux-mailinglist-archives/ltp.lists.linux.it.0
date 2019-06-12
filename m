Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 96E2F42AC5
	for <lists+linux-ltp@lfdr.de>; Wed, 12 Jun 2019 17:21:55 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 60CE83EAE4A
	for <lists+linux-ltp@lfdr.de>; Wed, 12 Jun 2019 17:21:55 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 8FF683EAE1E
 for <ltp@lists.linux.it>; Wed, 12 Jun 2019 17:21:53 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id BDC261401855
 for <ltp@lists.linux.it>; Wed, 12 Jun 2019 17:21:52 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id E77D4AF9A;
 Wed, 12 Jun 2019 15:21:51 +0000 (UTC)
Date: Wed, 12 Jun 2019 17:21:51 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Jan Stancek <jstancek@redhat.com>
Message-ID: <20190612152151.GC3048@rei.lan>
References: <916c20b9a379badd37a85aa1e1339566c9807d23.1560248542.git.jstancek@redhat.com>
 <20190612135929.GA3048@rei.lan>
 <278919491.27726511.1560349549390.JavaMail.zimbra@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <278919491.27726511.1560349549390.JavaMail.zimbra@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
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

SGkhCj4gRGVmYXVsdCBhbGlnbm1lbnQgaXMgbm90IGVub3VnaDoKPiAgIEFsaWdubWVudDogICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAyICogc2l6ZW9mKHNpemVfdCkgKGRlZmF1bHQpCj4g
ICAgICAgIChpLmUuLCA4IGJ5dGUgYWxpZ25tZW50IHdpdGggNGJ5dGUgc2l6ZV90KS4gVGhpcyBz
dWZmaWNlcyBmb3IKPiAgICAgICAgbmVhcmx5IGFsbCBjdXJyZW50IG1hY2hpbmVzIGFuZCBDIGNv
bXBpbGVycy4gSG93ZXZlciwgeW91IGNhbgo+ICAgICAgICBkZWZpbmUgTUFMTE9DX0FMSUdOTUVO
VCB0byBiZSB3aWRlciB0aGFuIHRoaXMgaWYgbmVjZXNzYXJ5Lgo+IAo+IEknbSBndWVzc2luZyBt
b3N0IG9mIHRlc3RzIGNyb3NzIE1fTU1BUF9USFJFU0hPTEQsIGFuZCBnZXQgcGFnZSBhbGlnbm1l
bnQKPiBmcm9tIG1tYXAuIEJ1dCBzaG91bGQgd2UgcmVseSBvbiB0aGF0Pwo+IAo+IEhvdyBhYm91
dCBwb3NpeF9tZW1hbGlnbigpPwoKSSBndWVzcyB0aGF0IHdlIG5lZWQgdG8gZml4IHRoZSBsdHBf
Y2xvbmVfbWFsbG9jKCkgZnVuY3Rpb24gYXMgd2VsbCwgd2UKc2hvdWxkIHByb2JhYmx5IGFkZCBh
IGhlbHBlciB0byBhbGxvY2F0ZSBtZW1vcnkgdG8gdGhlIGNsb25lIGxpYnJhcnkKd2hpY2ggd291
bGQgbWFrZSB1c2Ugb2YgdGhlIHBvc2l4X21lbWFsaWduKCkgYW5kIG1ha2UgdXNlIG9mIGl0Cmlu
dGVybmFsbHkgYXMgd2VsbC4uLgoKLS0gCkN5cmlsIEhydWJpcwpjaHJ1YmlzQHN1c2UuY3oKCi0t
IApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAK
