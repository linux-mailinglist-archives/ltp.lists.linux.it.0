Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DD57387667
	for <lists+linux-ltp@lfdr.de>; Tue, 18 May 2021 12:25:19 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4EDCF3CA3D9
	for <lists+linux-ltp@lfdr.de>; Tue, 18 May 2021 12:25:18 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id C94EA3C5E47
 for <ltp@lists.linux.it>; Tue, 18 May 2021 12:25:14 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 2CA631000DEE
 for <ltp@lists.linux.it>; Tue, 18 May 2021 12:25:13 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 56A1DAFC4;
 Tue, 18 May 2021 10:25:13 +0000 (UTC)
Date: Tue, 18 May 2021 11:59:01 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Alexey Kodanev <aleksei.kodanev@bell-sw.com>
Message-ID: <YKOP5cWttVUANr0i@yuki>
References: <20210517085637.16866-1-aleksei.kodanev@bell-sw.com>
 <YKLKn3o7A38/nyjt@pevik>
 <235d2495-92af-7638-c468-9456dd202296@bell-sw.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <235d2495-92af-7638-c468-9456dd202296@bell-sw.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] network/lib6/getaddrinfo01: rewrite with the new
 API + use static hostnames
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
> >> The test is now independent of various machine settings
> >> regarding the test host name as it adds predefined names
> >> and aliases to /etc/hosts file and restores it to its
> >> original state after completing the test.
> > 
> >> This should fix the following failures:
> >> * when gethostname() returns an alias name that doesn't
> >>   match canonical name;
> >> * No AAAA record for the returned name from gethostname().
> > 
> >> Addresses and names added to /etc/hosts are more or less
> >> unique, so that there are no conflicts with the existing
> >> configuration.
> > 
> >> Also most of the duplicate code is now gone.
> > 
> > Thanks a lot. On a first look looks very nice, I'll try to review tomorrow.
> > I'd be for merging this before release as the old code is broken.
> 
> Yeah, I'm for it too.

I would be a bit more cautious now as it's fairly late in the release
process. We already started pre-release testing and got some reports in.
Merging this would invalidate results for this test and would require
re-testing.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
