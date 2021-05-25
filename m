Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id CEF0838FDE8
	for <lists+linux-ltp@lfdr.de>; Tue, 25 May 2021 11:32:33 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8C4093C2B74
	for <lists+linux-ltp@lfdr.de>; Tue, 25 May 2021 11:32:33 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 54FD33C1DA6
 for <ltp@lists.linux.it>; Tue, 25 May 2021 11:32:32 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id C2D4614004E6
 for <ltp@lists.linux.it>; Tue, 25 May 2021 11:32:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1621935150; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=h7slLzlzFsbsNZ7SYdSsEz77XhRoK4ub8RVfxKVP1ec=;
 b=MutnidyNve2BgCefvw+Y90j1ZPhkWCfdfmwtqJoE5v7gGzoxaqogkqBx7Z/pkzPqgsLvoC
 sMcOUrx321qaqj/YEBRlfQQ5AlhHHTJoRB5XdJWZk0+VqS/x4Z7s2Zyy0WBZyMCM9EXAhd
 lSnRvBV0A/WwtSR4lQGdtzAQYtIw1/E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1621935150;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=h7slLzlzFsbsNZ7SYdSsEz77XhRoK4ub8RVfxKVP1ec=;
 b=YOZTo0oJmjCQSUTS0HOzp7CqRUTqelWeLtvsb5bW/dyqEhqWv65I4UT/On7KGkmFmX8qGD
 wxZ+zutasXRgW/Bw==
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 57321AEC8
 for <ltp@lists.linux.it>; Tue, 25 May 2021 09:32:30 +0000 (UTC)
Date: Tue, 25 May 2021 11:06:27 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Richard Palethorpe <rpalethorpe@suse.de>
Message-ID: <YKy+E935XKO91pOd@yuki>
References: <20210513152125.25766-1-rpalethorpe@suse.com>
 <20210513152125.25766-7-rpalethorpe@suse.com>
 <YKT7xfzaUD7nNPzX@yuki> <871ra1lrf3.fsf@suse.de>
 <87y2c8juyu.fsf@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87y2c8juyu.fsf@suse.de>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.3 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 6/6] sched/cgroup: Add cfs_bandwidth01
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

Hi!
> I think maybe this API makes a fundamental mistake of mixing memory/object
> management with actual creation and deletion of CGroups. OTOH that is
> not really clear either.
> 
> But if a child process starts deleting CGroups, which might be a
> reasonable thing to do, then we will get a mismatch between child and
> parent. Then the cleanup will be wrong.

Good point. I guess that we can make up rules that would make sure we do
not run cleanup both in the parent and child, but that would probably
overcomplicate the library.

> Also any kind of linked list or array implementation uses more lines of
> code than the cleanup function and more complex for sure... even if we
> have 10 test cases like this is it really work saving a few lines in
> each case?
> 
> I don't know. But I think we need to see a few more cases.

Makes sense.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
