Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B4AA8387C54
	for <lists+linux-ltp@lfdr.de>; Tue, 18 May 2021 17:20:36 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0DC123CA774
	for <lists+linux-ltp@lfdr.de>; Tue, 18 May 2021 17:20:36 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 727C63CA59A
 for <ltp@lists.linux.it>; Tue, 18 May 2021 17:20:32 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id D6EEC1401109
 for <ltp@lists.linux.it>; Tue, 18 May 2021 17:20:31 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 1117AAFBF;
 Tue, 18 May 2021 15:20:31 +0000 (UTC)
Date: Tue, 18 May 2021 17:20:29 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Alexey Kodanev <aleksei.kodanev@bell-sw.com>
Message-ID: <YKPbPXy113n/5IFo@pevik>
References: <20210518091422.41857-1-aleksei.kodanev@bell-sw.com>
 <f584f853-c13c-cc16-8e75-085af0b82418@bell-sw.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f584f853-c13c-cc16-8e75-085af0b82418@bell-sw.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] network/lib6/getaddrinfo01: rewrite with the
 new API + use static hostnames
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

Hi Alexey,

> On 18.05.2021 12:14, Alexey Kodanev wrote:
> > The test is now independent of various machine settings
> > regarding the test host name as it adds predefined names
> > and aliases to /etc/hosts file and restores it to its
> > original state after completing the test.

> > This should fix the following failures:
> > * when gethostname() returns an alias name that doesn't
> >   match canonical name;
> > * No AAAA record for the returned name from gethostname().

> > Addresses and names added to /etc/hosts are more or less
> > unique, so that there are no conflicts with the existing
> > configuration.

> > Also most of the duplicate code is now gone.

> > Signed-off-by: Alexey Kodanev <aleksei.kodanev@bell-sw.com>
> > Reviewed-by: Petr Vorel <pvorel@suse.cz>
> > ---

> Adding missing v2 update suggested by Petr:
> * description tag
> * new check_addrinfo_badflags(const char *) to remove even more code
> duplication.
Nice, thanks!

I've tested it in various distros running and compiling (+ it actually fixes
configuration bug, ...) but understand Cyril's concern about breakage last
minute before release. So we should probably merge after the release.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
