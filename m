Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id ADA16154BC
	for <lists+linux-ltp@lfdr.de>; Mon,  6 May 2019 21:57:10 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 646983EAEB2
	for <lists+linux-ltp@lfdr.de>; Mon,  6 May 2019 21:57:10 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 99FEB3EA0B7
 for <ltp@lists.linux.it>; Mon,  6 May 2019 21:57:07 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 733BE140202B
 for <ltp@lists.linux.it>; Mon,  6 May 2019 21:57:06 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id EB2E0ADE0;
 Mon,  6 May 2019 19:57:04 +0000 (UTC)
Date: Mon, 6 May 2019 21:57:03 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Alexey Kodanev <alexey.kodanev@oracle.com>
Message-ID: <20190506195703.GA11266@dell5510>
References: <20190427053929.7372-1-pvorel@suse.cz>
 <5cff91e0-c566-27c3-95dd-39dd4e2b6d0e@oracle.com>
 <20190502114459.GA32460@dell5510>
 <0c7a3010-d7d6-1d83-0548-148adb55b2cc@oracle.com>
 <20190506153220.GA21222@dell5510>
 <25305d65-d8ab-f0fa-dd39-defc093d6823@oracle.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <25305d65-d8ab-f0fa-dd39-defc093d6823@oracle.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Cc: ltp@lists.linux.it
Subject: Re: [LTP] [PATCH 1/1] net/broken_ip: Rewrite into new API
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

SGkgQWxleGV5LAoKPiA+PiBPSy4gUGVyaGFwcyB3ZSBzaG91bGQgcmVuYW1lIHRoZW0gdG8gaW5k
aWNhdGUgdGhhdCB0aGV5IHJlbGF0ZSB0byBucy1pY21wdl9zZW5kZXIsCj4gPj4gYmVjYXVzZSB0
aGUgbWF4aW11bSBpY21wIGRhdGEgc2l6ZSBpcyA2NTUzNSAtIGhlYWRlcnMsIG5vdCB0aG9zZSB2
YWx1ZXMuCj4gPiBUcnVlLiBIb3cgYWJvdXQgdGhpczoKCj4gPiBleHBvcnQgTlNfSUNNUFY0X1NF
TkRFUl9EQVRBX01BWFNJWkU9MTQ3Mgo+ID4gZXhwb3J0IE5TX0lDTVBWNl9TRU5ERVJfREFUQV9N
QVhTSVpFPTE0NTIKCj4gQWdyZWUuClRoYW5rcywgbWVyZ2VkIQoKS2luZCByZWdhcmRzLApQZXRy
CgotLSAKTWFpbGluZyBsaXN0IGluZm86IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlzdGluZm8v
bHRwCg==
