Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id AA8CF389729
	for <lists+linux-ltp@lfdr.de>; Wed, 19 May 2021 21:59:41 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1F0263C5FA0
	for <lists+linux-ltp@lfdr.de>; Wed, 19 May 2021 21:59:41 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 279A13C1A7E
 for <ltp@lists.linux.it>; Wed, 19 May 2021 21:59:36 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 8E56D601A64
 for <ltp@lists.linux.it>; Wed, 19 May 2021 21:59:36 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id CBE9EADE7;
 Wed, 19 May 2021 19:59:35 +0000 (UTC)
Date: Wed, 19 May 2021 21:59:34 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Alexey Kodanev <aleksei.kodanev@bell-sw.com>
Message-ID: <YKVuJksJkHh7uxbX@pevik>
References: <20210518091422.41857-1-aleksei.kodanev@bell-sw.com>
 <YKQSTR1wkB/U81Em@pevik>
 <b7744613-ee02-c4a5-e5ed-da3da60a6e7b@bell-sw.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b7744613-ee02-c4a5-e5ed-da3da60a6e7b@bell-sw.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
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
Reply-To: Petr Vorel <pvorel@suse.cz>
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

> On 18.05.2021 22:15, Petr Vorel wrote:
> > Hi Alexey,

> > ...
> >> +static void setup(void)
> >> +{
> >> +	unsigned int i;
> >> +	int fd;
> > ...
> >> +	SAFE_CP(host_file, "hosts");
> > One more thing, could we check for /etc/hosts before?

> Hi Petr,

> Yes, why not. I assume it can be read-only, but I hope we won't hide a
> configuration bug with this...

Hi Alexey,

hm, not sure if we can hide configuration bug. For a traditional distros
probably yes, but not for embedded and other special distros.
And good point, I'd TCONF also when file is read-only (which is more likely that
file not presented). We can always think about different solution if anybody
complains about this requirement.

Kind regards,
Petr

> > Because we want to TCONF on systems without it not TBROK.
> > And I guess there are embedded systems without it out there.

> > Kind regards,
> > Petr



-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
