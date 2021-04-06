Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id C2CD4354F10
	for <lists+linux-ltp@lfdr.de>; Tue,  6 Apr 2021 10:51:55 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DF6293C759D
	for <lists+linux-ltp@lfdr.de>; Tue,  6 Apr 2021 10:51:54 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 700FC3C00FC
 for <ltp@lists.linux.it>; Tue,  6 Apr 2021 10:51:50 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id EBC6F600681
 for <ltp@lists.linux.it>; Tue,  6 Apr 2021 10:51:49 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A72A4AF9E;
 Tue,  6 Apr 2021 08:51:47 +0000 (UTC)
Date: Tue, 6 Apr 2021 10:51:45 +0200
From: Petr Vorel <pvorel@suse.cz>
To: He Zhe <zhe.he@windriver.com>
Message-ID: <YGwhIRy5xQYYYFxG@pevik>
References: <20210402045331.18686-1-zhe.he@windriver.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210402045331.18686-1-zhe.he@windriver.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] lapi/syscalls: Correct syscall numbers for all
 MIPS arches
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

Hi Zhe,

> Add the offsets to syscall numbers for o32 n32 and n64.

Thanks, merged.
I re-added underscored definitions: _llseek, _newselect, _sysctl.
_llseek has not been used in LTP, but __NR__sysctl and __NR__newselect are.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
