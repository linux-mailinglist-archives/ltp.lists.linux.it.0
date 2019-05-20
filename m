Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 167EB2419A
	for <lists+linux-ltp@lfdr.de>; Mon, 20 May 2019 21:58:11 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CD484294AC3
	for <lists+linux-ltp@lfdr.de>; Mon, 20 May 2019 21:58:10 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 2AB41294AB3
 for <ltp@lists.linux.it>; Mon, 20 May 2019 21:58:08 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id B1B051A00A41
 for <ltp@lists.linux.it>; Mon, 20 May 2019 21:58:07 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id C6EE5ACE1;
 Mon, 20 May 2019 19:58:06 +0000 (UTC)
Date: Mon, 20 May 2019 21:58:05 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Jan Stancek <jstancek@redhat.com>
Message-ID: <20190520195805.GA22932@x230>
References: <a5e65ca65d88177d9142cbd2d5a3ddf5dda174b5.1558379215.git.jstancek@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a5e65ca65d88177d9142cbd2d5a3ddf5dda174b5.1558379215.git.jstancek@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Cc: liwan@redhat.com, ltp@lists.linux.it
Subject: Re: [LTP] [PATCH] shmctl01: don't use hardcoded index == 0 for
 SHM_STAT test
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
Reply-To: Petr Vorel <pvorel@suse.cz>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGkgSmFuLAoKPiBUZXN0IGZhaWxzIG9uIFNITV9TVEFUIHRlc3RjYXNlOgo+ICAgIHNobWN0bDAx
ICAgIDUgIFRGQUlMICA6ICBzaG1jdGwwMS5jOjE3Mzogc2htY3RsMDEgY2FsbCBmYWlsZWQKPiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgZXJybm8gPSAyMiA6IEludmFsaWQgYXJndW1lbnQK
PiAgICBzaG1jdGwoMCwgU0hNX1NUQVQsIDB4NjAxMDYwKSAgICAgICAgICAgPSAtRUlOVkFMCgo+
IHNpbmNlIGZvbGxvd2luZyBjb21taXQ6Cj4gICAgY29tbWl0IDk5ZGI0NmVhMjkyNzgwY2Q5Nzhk
NTY5MzJkOTQ0NWIxZThiZGFmZTgKPiAgICBBdXRob3I6IE1hbmZyZWQgU3ByYXVsIDxtYW5mcmVk
QGNvbG9yZnVsbGlmZS5jb20+Cj4gICAgRGF0ZTogICBUdWUgTWF5IDE0IDE1OjQ2OjM2IDIwMTkg
LTA3MDAKPiAgICAgIGlwYzogZG8gY3ljbGljIGlkIGFsbG9jYXRpb24gZm9yIHRoZSBpcGMgb2Jq
ZWN0LgoKPiBEb24ndCByZWx5IG9uIGluZGV4IDAgYmVpbmcgYWx3YXlzIGF2YWlsYWJsZSwgYnV0
IGluc3RlYWQKPiB1c2UgKG1heGltdW0pIGluZGV4IHJldHVybmVkIGJ5IFNITV9JTkZPLgoKPiBT
aWduZWQtb2ZmLWJ5OiBKYW4gU3RhbmNlayA8anN0YW5jZWtAcmVkaGF0LmNvbT4KUmV2aWV3ZWQt
Ynk6IFBldHIgVm9yZWwgPHBldHIudm9yZWxAZ21haWwuY29tPgoKR29vZCBjYXRjaCArIGZ1cnRo
ZXIgaW1wcm92ZW1lbnRzLgoKS2luZCByZWdhcmRzLApQZXRyCgotLSAKTWFpbGluZyBsaXN0IGlu
Zm86IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlzdGluZm8vbHRwCg==
