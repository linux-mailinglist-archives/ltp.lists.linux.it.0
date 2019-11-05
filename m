Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F656EFEF4
	for <lists+linux-ltp@lfdr.de>; Tue,  5 Nov 2019 14:49:09 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 36A433C22C6
	for <lists+linux-ltp@lfdr.de>; Tue,  5 Nov 2019 14:49:09 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 65B3F3C22A3
 for <ltp@lists.linux.it>; Tue,  5 Nov 2019 14:49:06 +0100 (CET)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id C2F791000ADE
 for <ltp@lists.linux.it>; Tue,  5 Nov 2019 14:49:05 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 1091BAFBA
 for <ltp@lists.linux.it>; Tue,  5 Nov 2019 13:49:05 +0000 (UTC)
Message-ID: <1572961744.4619.20.camel@suse.de>
From: Clemens Famulla-Conrad <cfamullaconrad@suse.de>
To: Petr Vorel <pvorel@suse.cz>
Date: Tue, 05 Nov 2019 14:49:04 +0100
In-Reply-To: <20191105132004.GA20849@dell5510>
References: <20191105112000.20633-1-cfamullaconrad@suse.de>
 <20191105132004.GA20849@dell5510>
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v1] cgroup_fj_stress: Avoid killall
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

Hi Petr,

On Tue, 2019-11-05 at 14:20 +0100, Petr Vorel wrote:
<snip>
> I wonder if we also want to kill cgroup_fj_proc this way (see
> cgroup_fj_common.sh).

I'm not sure if I understand you. We do kill cgroup_fj_proc this way.
The `killall -9 cgroup_fj_proc` call in cgrouip_fj_common.sh looks for
me like a cleaner and there is no `wait` or similar afterwards, so I
would guess we are not facing the problem here. And I would keep
killall here.
As far as I can see, all other `cgroup_fj_proc&` calls already kill
them separately.

> I guess you're not planning to create minimal reproducer to prove the
> problem of
> left processes after killall, are you?

Sure nice idea, I can give it a try. But not within this patchset.

Thanks
Clemens

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
