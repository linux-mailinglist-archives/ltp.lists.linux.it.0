Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 90BB6184912
	for <lists+linux-ltp@lfdr.de>; Fri, 13 Mar 2020 15:18:12 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0EC533C592D
	for <lists+linux-ltp@lfdr.de>; Fri, 13 Mar 2020 15:18:12 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 81D243C58F1
 for <ltp@lists.linux.it>; Fri, 13 Mar 2020 15:18:08 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 484431A007E9
 for <ltp@lists.linux.it>; Fri, 13 Mar 2020 15:18:07 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id DF100B1A5;
 Fri, 13 Mar 2020 14:18:05 +0000 (UTC)
Date: Fri, 13 Mar 2020 15:17:01 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Alexey Kodanev <alexey.kodanev@oracle.com>
Message-ID: <20200313141701.GA24523@dell5510>
References: <20200311175011.12171-1-pvorel@suse.cz>
 <20200311175011.12171-3-pvorel@suse.cz>
 <20200311185638.GA12912@dell5510>
 <46684b2a-2e35-8750-bddf-62ba199fcc9f@oracle.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <46684b2a-2e35-8750-bddf-62ba199fcc9f@oracle.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 3/3] nfs_lib: Add option to run traffic via lo
 on netns
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

> Hi Petr, the patch-series LGTM,

> Reviewed-by: Alexey Kodanev <alexey.kodanev@oracle.com>
Thank for your time, pushed!

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
