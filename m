Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 24B032D992C
	for <lists+linux-ltp@lfdr.de>; Mon, 14 Dec 2020 14:47:07 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D56D33C5A77
	for <lists+linux-ltp@lfdr.de>; Mon, 14 Dec 2020 14:47:06 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 56CBD3C2A34
 for <ltp@lists.linux.it>; Mon, 14 Dec 2020 14:47:03 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id CFA89140004A
 for <ltp@lists.linux.it>; Mon, 14 Dec 2020 14:47:02 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 274FBAC10;
 Mon, 14 Dec 2020 13:47:02 +0000 (UTC)
Date: Mon, 14 Dec 2020 14:47:00 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Alexey Kodanev <alexey.kodanev@oracle.com>
Message-ID: <X9ds1PGTYPALB5DE@pevik>
References: <20201211071545.10209-1-pvorel@suse.cz>
 <e504fd30-aacd-ec7b-6f09-172242573e6e@oracle.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e504fd30-aacd-ec7b-6f09-172242573e6e@oracle.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] host01.sh: Allow to overwrite the default
 hostname
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

> On 11.12.2020 10:15, Petr Vorel wrote:
> > Using hostname for test requires DNS setup.
> > Allow to set hostname (e.g. github.com) via $HOSTNAME in case host not
> > set. This restores the old behavior (the legacy API version used $RHOST).

> > Suggested-by: Petr Cervinka <pcervinka@suse.com>
> > Signed-off-by: Petr Vorel <pvorel@suse.cz>
> > ---
> >  testcases/network/tcp_cmds/host/host01.sh | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)

> Acked-by: Alexey Kodanev <alexey.kodanev@oracle.com>
Thanks! Merged.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
