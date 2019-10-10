Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 07F11D2812
	for <lists+linux-ltp@lfdr.de>; Thu, 10 Oct 2019 13:39:11 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8D5193C0DFD
	for <lists+linux-ltp@lfdr.de>; Thu, 10 Oct 2019 13:39:10 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 1E19C3C0DFD
 for <ltp@lists.linux.it>; Thu, 10 Oct 2019 13:39:07 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 9CC0F1400E4C
 for <ltp@lists.linux.it>; Thu, 10 Oct 2019 13:39:06 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id D0F5EAD63;
 Thu, 10 Oct 2019 11:39:05 +0000 (UTC)
Date: Thu, 10 Oct 2019 13:39:04 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20191010113904.GB23153@dell5510>
References: <20191010081752.11334-1-pifang@redhat.com>
 <20191010110602.GB2508@rei.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191010110602.GB2508@rei.lan>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] acct: fix version check on big endian system
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
Cc: liwan@redhat.com, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi,

> > ac_version = ACCT_VERION | ACCT_BYTEORDER
> > which is 0x83 (131) on big endian system.

> > failure output:
> > tst_kconfig.c:62: INFO: Parsing kernel config
> > '/boot/config-4.18.0-147.el8.s390x'
> > tst_test.c:1118: INFO: Timeout per run is 0h 05m 00s
> > tst_kconfig.c:62: INFO: Parsing kernel config
> > '/boot/config-4.18.0-147.el8.s390x'
> > acct02.c:239: INFO: Verifying using 'struct acct_v3'
> > acct02.c:192: INFO: == entry 1 ==
> > acct02.c:147: INFO: ac_version != 3 (131)
> > acct02.c:192: INFO: == entry 2 ==
> > acct02.c:82: INFO: ac_comm != 'acct02_helper' ('acct02')
> > acct02.c:133: INFO: ac_exitcode != 32768 (0)
> > acct02.c:141: INFO: ac_ppid != 34501 (34500)
> > acct02.c:147: INFO: ac_version != 3 (131)
> > acct02.c:182: FAIL: end of file reached

> Looks good, acked.

> Also please consider a patch to the man 5 acct, it says that the version
> is always set to 3 for acct_v3 structure.
+1.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
