Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B887B439F1
	for <lists+linux-ltp@lfdr.de>; Thu, 13 Jun 2019 17:17:45 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 869F7294AE7
	for <lists+linux-ltp@lfdr.de>; Thu, 13 Jun 2019 17:17:45 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 424273EA794
 for <ltp@lists.linux.it>; Thu, 13 Jun 2019 17:17:42 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id A95F96021A4
 for <ltp@lists.linux.it>; Thu, 13 Jun 2019 17:17:41 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 9070BAF19;
 Thu, 13 Jun 2019 15:17:40 +0000 (UTC)
Date: Thu, 13 Jun 2019 17:17:39 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Sandeep Patil <sspatil@android.com>
Message-ID: <20190613151738.GF29926@rei.lan>
References: <20190610002610.2187-1-sspatil@android.com>
 <20190610002610.2187-4-sspatil@android.com>
 <20190613145507.GD29926@rei.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190613145507.GD29926@rei.lan>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Cc: chrubis@suze.cz, kernel-team@android.com, ltp@lists.linux.it
Subject: Re: [LTP] [PATCH v2 3/3] syscalls/bind01: convert to new library.
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

SGkhCj4gSG93ZXZlciB0aGUgdGVzdCBmYWlscyB3aXRoIC1pIDIgYWZ0ZXIgdGhpcyBwYXRjaCBz
aW5jZSBvbiBzZWNvbmQKPiBpdGVyYXRpb24gc2luY2UgdGhlIHNvY2tldCBpcyBhbHJlYWR5IGJp
bmQgZm9yIHRoZSBwb3NzaXRpdmUgdGVzdAo+IGJlY2F1c2Ugd2Ugbm8gbG9uZ2VyIGNsb3NlIHRo
ZSBzb2NrZXQgYWZ0ZXIgZWFjaCBpdGVyYXRpb24uIExvb2tpbmcgYXQKPiB0aGUgYmluZCB0ZXN0
cyB3ZSBzaG91bGQgbW92ZSB0aGlzIG9uZSBpbnRvIGEgc2VwYXJhdGUgdGVzdGNhc2UgYW5kIGFk
ZAo+IGEgZmV3IG1vcmUgcG9zaXRpdmUgdGVzdHMgYXMgd2VsbCB3ZSBzZWVtIHRvIHRlc3Qgb25s
eSBBRl9JTkVULAo+IFNPQ0tfU1RSRUFNIGNvbWJpbmF0aW9uIHdoaWNoIGRvZXMgbm90IGV2ZW4g
Y292ZXIgaXB2NCBub3Igd2UgYXR0ZW1wIHRvCj4gY29ubmVjdCB0byB0aGUgc29ja2V0IHRoYXQg
aGF2ZSBiZWVuIGJpbmQuCgpGWUkgSSd2ZSBhZGRlZCBhbiBpc3N1ZSBzbyB0aGF0IHRoaXMgaXMg
bm90IGZvcmdvdHRlbjoKCmh0dHBzOi8vZ2l0aHViLmNvbS9saW51eC10ZXN0LXByb2plY3QvbHRw
L2lzc3Vlcy81MzgKCi0tIApDeXJpbCBIcnViaXMKY2hydWJpc0BzdXNlLmN6CgotLSAKTWFpbGlu
ZyBsaXN0IGluZm86IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlzdGluZm8vbHRwCg==
