Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D9E8C2D9FE
	for <lists+linux-ltp@lfdr.de>; Wed, 29 May 2019 12:07:32 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 911483EA20C
	for <lists+linux-ltp@lfdr.de>; Wed, 29 May 2019 12:07:32 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 5146C3EA132
 for <ltp@lists.linux.it>; Wed, 29 May 2019 12:07:31 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 04A442013AC
 for <ltp@lists.linux.it>; Wed, 29 May 2019 12:07:29 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 34FA6AF68;
 Wed, 29 May 2019 10:07:29 +0000 (UTC)
Date: Wed, 29 May 2019 12:07:28 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Sandeep Patil <sspatil@android.com>
Message-ID: <20190529100727.GA26685@rei.lan>
References: <20190519003808.47425-1-sspatil@android.com>
 <20190519003808.47425-2-sspatil@android.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190519003808.47425-2-sspatil@android.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Cc: chrubis@suze.cz, kernel-team@android.com, ltp@lists.linux.it
Subject: Re: [LTP] [PATCH 1/5] syscalls/adjtimex01: Convert to new library
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

SGkhClB1c2hlZCB3aXRoIG1pbm9yIGNoYW5nZXMsIHRoYW5rcy4KCkkndmUgYWRkZWQgY3VybHkg
YnJhY2VzIGFyb3VuZCB0aGUgbXVsdGlsaW5lIGlmIGJvZGllcywgd2hpY2ggaXMKcHJlZmVyZWQg
aW4gTEtNTCBjb2Rpbmcgc3R5bGUuCgotLSAKQ3lyaWwgSHJ1YmlzCmNocnViaXNAc3VzZS5jegoK
LS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0
cAo=
