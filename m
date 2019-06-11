Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 398283D6E0
	for <lists+linux-ltp@lfdr.de>; Tue, 11 Jun 2019 21:34:52 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 066B83EAEBA
	for <lists+linux-ltp@lfdr.de>; Tue, 11 Jun 2019 21:34:52 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 365CA3EA9E9
 for <ltp@lists.linux.it>; Tue, 11 Jun 2019 21:34:48 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 776026017D0
 for <ltp@lists.linux.it>; Tue, 11 Jun 2019 21:34:48 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id A5C92ADFA;
 Tue, 11 Jun 2019 19:34:47 +0000 (UTC)
Date: Tue, 11 Jun 2019 21:34:44 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Enji Cooper <yaneurabeya@gmail.com>
Message-ID: <20190611193444.GA18737@dell5510>
References: <20190606143017.2233-1-pvorel@suse.cz>
 <F97F23A1-18C6-4B90-B297-F464DD0C568B@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <F97F23A1-18C6-4B90-B297-F464DD0C568B@gmail.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Cc: ltp@lists.linux.it
Subject: Re: [LTP] [PATCH] shell: Fix tst_get_unused_port endianity
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

SGksCgo+IFJldmlld2VkLWJ5OiBFbmppIENvb3BlciA8eWFuZXVyYWJleWFAZ21haWwuY29tIDxt
YWlsdG86eWFuZXVyYWJleWFAZ21haWwuY29tPj4KVGhhbmtzLCBtZXJnZWQuCgo+IFRoYW5rcyEK
PiAtRW5qaQoKS2luZCByZWdhcmRzLApQZXRyCgotLSAKTWFpbGluZyBsaXN0IGluZm86IGh0dHBz
Oi8vbGlzdHMubGludXguaXQvbGlzdGluZm8vbHRwCg==
