Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CD6D43649
	for <lists+linux-ltp@lfdr.de>; Thu, 13 Jun 2019 15:10:26 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 16592294ADE
	for <lists+linux-ltp@lfdr.de>; Thu, 13 Jun 2019 15:10:26 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 28D5E3EA791
 for <ltp@lists.linux.it>; Thu, 13 Jun 2019 15:10:23 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id BE3EF1A014C6
 for <ltp@lists.linux.it>; Thu, 13 Jun 2019 15:10:21 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 4005CAF2B;
 Thu, 13 Jun 2019 13:10:20 +0000 (UTC)
Date: Thu, 13 Jun 2019 15:10:18 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <20190613131018.GA29926@rei.lan>
References: <20190605072126.19856-1-pvorel@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190605072126.19856-1-pvorel@suse.cz>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Cc: ltp@lists.linux.it
Subject: Re: [LTP] [PATCH 1/2] inotify: Add SAFE_MYINOTIFY_INIT{,
	1}() helpers
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

SGkhClRoZXNlIHR3byBwYXRjaGVzIGFyZSBvYnZpb3VzbHkgT0suCgpXZWxsIEkgd2Ugd2VyZSBw
ZWRhbnRpYyB0aGUgbGljZW5jZSBjaGFuZ2Ugc2hvdWxkIGJlIGluIGEgc2VwYXJhdGUKcGF0Y2gs
IGJ1dCBJIGd1ZXNzIHRoYXQgaXQncyBmaW5lIGFzIGl0IGlzLgoKQWxzbyB3ZSBzaG91bGQgcHJv
YmFibHkgc3dpdGNoIHRvIHRoZSBpbm90aWZ5X2luaXQoKSBmcm9tIHN5cy9pbm90aWZ5LmgKYW5k
IGRyb3AgdGhlIG15IGZyb20gdGhlIGZ1bmN0aW9ucyBhbmQgbWFjcm9zLCBidXQgdGhhdCBjb3Vs
ZCBiZSBkb25lIGluCmEgc3Vic2VxdWVudCBwYXRjaC4KCi0tIApDeXJpbCBIcnViaXMKY2hydWJp
c0BzdXNlLmN6CgotLSAKTWFpbGluZyBsaXN0IGluZm86IGh0dHBzOi8vbGlzdHMubGludXguaXQv
bGlzdGluZm8vbHRwCg==
