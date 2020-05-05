Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BBE01C5690
	for <lists+linux-ltp@lfdr.de>; Tue,  5 May 2020 15:17:30 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id ECF7C3C57EA
	for <lists+linux-ltp@lfdr.de>; Tue,  5 May 2020 15:17:29 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 8C4543C2674
 for <ltp@lists.linux.it>; Tue,  5 May 2020 15:17:27 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 6089D200DBB
 for <ltp@lists.linux.it>; Tue,  5 May 2020 15:17:26 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id C8CEBAC11
 for <ltp@lists.linux.it>; Tue,  5 May 2020 13:17:28 +0000 (UTC)
Date: Tue, 5 May 2020 15:17:24 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Martin Doucha <mdoucha@suse.cz>
Message-ID: <20200505131724.GA21884@dell5510>
References: <20200505102456.13004-1-mdoucha@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200505102456.13004-1-mdoucha@suse.cz>
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/2] Add test for CVE 2016-8655
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

Hi Martin,

> Signed-off-by: Martin Doucha <mdoucha@suse.cz>

Reviewed-by: Petr Vorel <pvorel@suse.cz>
Both patches LGTM.

gcc 4 from CentOS 6 strikes again:

https://travis-ci.org/github/pevik/ltp/jobs/683350147
setsockopt06.c: In function 'thread_run':
setsockopt06.c:55: error: variable 'req' has initializer but incomplete type
setsockopt06.c:56: error: unknown field 'tp_block_size' specified in initializer
setsockopt06.c:56: warning: excess elements in struct initializer
setsockopt06.c:56: warning: (near initialization for 'req')
setsockopt06.c:57: error: unknown field 'tp_block_nr' specified in initializer
setsockopt06.c:57: warning: excess elements in struct initializer
setsockopt06.c:57: warning: (near initialization for 'req')
setsockopt06.c:58: error: unknown field 'tp_frame_size' specified in initializer
setsockopt06.c:58: warning: excess elements in struct initializer
setsockopt06.c:58: warning: (near initialization for 'req')
setsockopt06.c:59: error: unknown field 'tp_frame_nr' specified in initializer
setsockopt06.c:59: warning: excess elements in struct initializer
setsockopt06.c:59: warning: (near initialization for 'req')
setsockopt06.c:60: error: unknown field 'tp_retire_blk_tov' specified in initializer
setsockopt06.c:61: warning: excess elements in struct initializer
setsockopt06.c:61: warning: (near initialization for 'req')
setsockopt06.c:55: error: storage size of 'req' isn't known
setsockopt06.c:55: warning: unused variable 'req'
setsockopt06.c: In function 'run':
setsockopt06.c:84: error: 'TPACKET_V3' undeclared (first use in this function)
setsockopt06.c:84: error: (Each undeclared identifier is reported only once
setsockopt06.c:84: error: for each function it appears in.)

both tests need this definition, which is already in setsockopt02.c.

#ifndef HAVE_STRUCT_TPACKET_REQ3
# define TPACKET_V3 2

struct tpacket_req3 {
	unsigned int	tp_block_size;
	unsigned int	tp_block_nr;
	unsigned int	tp_frame_size;
	unsigned int	tp_frame_nr;
	unsigned int	tp_retire_blk_tov;
	unsigned int	tp_sizeof_priv;
	unsigned int	tp_feature_req_word;
};
#endif

I wanted to propose after release dropping gcc 4 support by deleting CentOS 6
from Travis (but maybe we should drop it even now). To keep the support, it'd be
good to add lapi/if_packet.h with this definition.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
