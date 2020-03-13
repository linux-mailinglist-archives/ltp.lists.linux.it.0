Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id CC229184743
	for <lists+linux-ltp@lfdr.de>; Fri, 13 Mar 2020 13:50:42 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6B0DF3C58FE
	for <lists+linux-ltp@lfdr.de>; Fri, 13 Mar 2020 13:50:42 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id AFD523C58E9
 for <ltp@lists.linux.it>; Fri, 13 Mar 2020 13:50:37 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 614BD1A01A33
 for <ltp@lists.linux.it>; Fri, 13 Mar 2020 13:50:37 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id B639CAD85;
 Fri, 13 Mar 2020 12:50:36 +0000 (UTC)
Date: Fri, 13 Mar 2020 13:50:35 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20200313125035.GA9456@dell5510>
References: <6648a9106e367d370012c8ee1d0d81c369779ba8.1584014172.git.viresh.kumar@linaro.org>
 <928553e5fd3518fccb363fb8b6ad079ac3c75fd2.1584090119.git.viresh.kumar@linaro.org>
 <20200313124920.GC6597@rei.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200313124920.GC6597@rei.lan>
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH V7 10/10] syscalls/open_tree: New tests
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi,

> > +	TEST(move_mount(fsmfd, "", AT_FDCWD, MNTPOINT,
> > +			MOVE_MOUNT_F_EMPTY_PATH));
> > +	SAFE_CLOSE(fsmfd);

> Here as well, shouldn't we just set the .mount_device flag instead?
Sorry for overlooking these. I was too quick.
I guess metan will fix it himself.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
