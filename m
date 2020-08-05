Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 31D3A23CADF
	for <lists+linux-ltp@lfdr.de>; Wed,  5 Aug 2020 15:10:43 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E1EE83C3262
	for <lists+linux-ltp@lfdr.de>; Wed,  5 Aug 2020 15:10:42 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 6388F3C2549
 for <ltp@lists.linux.it>; Wed,  5 Aug 2020 15:10:41 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id E024A6009EF
 for <ltp@lists.linux.it>; Wed,  5 Aug 2020 15:09:11 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id DA3E8B60D;
 Wed,  5 Aug 2020 13:10:56 +0000 (UTC)
Date: Wed, 5 Aug 2020 15:11:00 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Johannes Berg <johannes@sipsolutions.net>
Message-ID: <20200805131100.GF5522@yuki.lan>
References: <8cf945033b519ac7240e42d29906d0d4ed3ed292.camel@sipsolutions.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8cf945033b519ac7240e42d29906d0d4ed3ed292.camel@sipsolutions.net>
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] looking for a test library home
X-BeenThere: ltp@lists.linux.it
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux Test Project <ltp.lists.linux.it>
List-Unsubscribe: <https://lists.linux.it/options/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=unsubscribe>
List-Archive: <http://lists.linux.it/pipermail/ltp/>
List-Post: <mailto:ltp@lists.linux.it>
List-Help: <mailto:ltp-request@lists.linux.it?subject=help>
List-Subscribe: <https://lists.linux.it/listinfo/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=subscribe>
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> What do you think? Ultimately, I think that would simply mean creating
> the github.com/linux-test-project/usfstl repository and I could
> contribute the code to there in some way, perhaps by sending email
> patches, or pull requests, or being maintainer there myself, whichever
> you feel is appropriate.

As for me I'm fine with creating a git repository and giving you
developer access there, we do that for lcov and it's working nicely
there.

-- 
Cyril Hrubis
(aka metan)
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
