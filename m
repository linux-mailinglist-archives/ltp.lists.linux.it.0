Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id DA1771803D7
	for <lists+linux-ltp@lfdr.de>; Tue, 10 Mar 2020 17:44:45 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7F2243C602C
	for <lists+linux-ltp@lfdr.de>; Tue, 10 Mar 2020 17:44:45 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id A10BE3C6000
 for <ltp@lists.linux.it>; Tue, 10 Mar 2020 17:44:43 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 1CA0D1000537
 for <ltp@lists.linux.it>; Tue, 10 Mar 2020 17:44:42 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 77621AC3A;
 Tue, 10 Mar 2020 16:44:42 +0000 (UTC)
Date: Tue, 10 Mar 2020 17:44:41 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Alexey Kodanev <alexey.kodanev@oracle.com>
Message-ID: <20200310164441.GC29541@dell5510>
References: <20200305192716.10313-1-pvorel@suse.cz>
 <20200305192716.10313-2-pvorel@suse.cz>
 <21baaca8-7c4e-7c11-2ff3-d10cf3e492e5@oracle.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <21baaca8-7c4e-7c11-2ff3-d10cf3e492e5@oracle.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/2] nfs: Detect disabled UDP
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

> > +	tst_rhost_run -c "grep -q '^[[:space:]]*udp[[:space:]]*=[[:space:]]*y' /etc/nfs.conf $config"

> Looks like the pattern doesn't detect when udp enabled by
> default and the config has commented default values,
> i.e. '# udp=y'.

> grep '^[# ]*udp *= *y' /etc/nfs.conf $config
Correct, this should be covered.
I'll send v2 with your much simpler regex, although I hoped we'd have something
error prone than just relying on content of config files. But IMHO checking
nfs-utils version cannot be easily done:

1) exportfs (which we require) does not print version (could be checked in
strings $(which exportfs), but we don't want unnecessary string dependency).
2) checking nfsstat (which will be probably presented on the server and even we
don't require it's presented, via if tst_cmd_available nfsstat && ...) can be
done, but we probably don't want to bother to parse it's version (UDP was
disabled in fbd7623d, which was in added in 2.1.2-rc2 and actually released in 2.2.1).

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
