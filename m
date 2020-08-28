Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 33DEA255712
	for <lists+linux-ltp@lfdr.de>; Fri, 28 Aug 2020 11:02:59 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C99993C2E4A
	for <lists+linux-ltp@lfdr.de>; Fri, 28 Aug 2020 11:02:58 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id E38273C136A
 for <ltp@lists.linux.it>; Fri, 28 Aug 2020 11:02:56 +0200 (CEST)
Received: from sipsolutions.net (s3.sipsolutions.net
 [IPv6:2a01:4f8:191:4433::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 228C81000CE9
 for <ltp@lists.linux.it>; Fri, 28 Aug 2020 11:02:55 +0200 (CEST)
Received: by sipsolutions.net with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.94) (envelope-from <johannes@sipsolutions.net>)
 id 1kBaHe-00C05Q-0m; Fri, 28 Aug 2020 11:02:54 +0200
Message-ID: <f4380b8c123e89662eee8cfbff9fa8c9d84e5e9f.camel@sipsolutions.net>
From: Johannes Berg <johannes@sipsolutions.net>
To: Cyril Hrubis <chrubis@suse.cz>
Date: Fri, 28 Aug 2020 11:02:36 +0200
In-Reply-To: <20200828090039.GA10501@yuki.lan>
References: <8cf945033b519ac7240e42d29906d0d4ed3ed292.camel@sipsolutions.net>
 <20200828090039.GA10501@yuki.lan>
User-Agent: Evolution 3.36.5 (3.36.5-1.fc32) 
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
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

On Fri, 2020-08-28 at 11:00 +0200, Cyril Hrubis wrote:
> Hi!
> > What do you think? Ultimately, I think that would simply mean creating
> > the github.com/linux-test-project/usfstl repository and I could
> > contribute the code to there in some way, perhaps by sending email
> > patches, or pull requests, or being maintainer there myself, whichever
> > you feel is appropriate.
> 
> I've created that repository, which github IDs should I invite to the
> team that can manage that repository?

Thanks!

I'll have to check which IDs any of the others have, but mine is
'jmberg'. Perhaps I'll just shepherd things for now.

Thanks,
johannes


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
