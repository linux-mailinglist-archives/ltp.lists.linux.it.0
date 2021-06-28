Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 305993B5EF9
	for <lists+linux-ltp@lfdr.de>; Mon, 28 Jun 2021 15:34:19 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9611B3C8D9D
	for <lists+linux-ltp@lfdr.de>; Mon, 28 Jun 2021 15:34:18 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 059523C291C
 for <ltp@lists.linux.it>; Mon, 28 Jun 2021 15:34:14 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 7F66B60086A
 for <ltp@lists.linux.it>; Mon, 28 Jun 2021 15:34:14 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 7C06F22445;
 Mon, 28 Jun 2021 13:34:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1624887253; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=808smqOWUCoucOOIWv64FMimJkNt02E240LgpAHjXCM=;
 b=FVQcQVSUK9VaM4SNRydaO7FEHobPRqC/vQULC89hgEifMCWu9/fsD6HgjGaad3R7li4UXC
 sKT5R6Jzz6C6NwI06fOT04L8xERj0wHr5X2KrQjGKGUb/lZNqxrKlb7QZ1FpsZWX4KAPCQ
 P7egoZ7GjV40ZaP1WIjaDXOYQVDwDdc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1624887253;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=808smqOWUCoucOOIWv64FMimJkNt02E240LgpAHjXCM=;
 b=cGijDxIQYQ+RuwhacWrIv8KpHcYYkUQzt/E05yb/pOFnmjJqMLTfDcODxkJ8qI6/g1Wwgj
 /1fiw15RPr3VREAw==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 5C6AB11906;
 Mon, 28 Jun 2021 13:34:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1624887253; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=808smqOWUCoucOOIWv64FMimJkNt02E240LgpAHjXCM=;
 b=FVQcQVSUK9VaM4SNRydaO7FEHobPRqC/vQULC89hgEifMCWu9/fsD6HgjGaad3R7li4UXC
 sKT5R6Jzz6C6NwI06fOT04L8xERj0wHr5X2KrQjGKGUb/lZNqxrKlb7QZ1FpsZWX4KAPCQ
 P7egoZ7GjV40ZaP1WIjaDXOYQVDwDdc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1624887253;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=808smqOWUCoucOOIWv64FMimJkNt02E240LgpAHjXCM=;
 b=cGijDxIQYQ+RuwhacWrIv8KpHcYYkUQzt/E05yb/pOFnmjJqMLTfDcODxkJ8qI6/g1Wwgj
 /1fiw15RPr3VREAw==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id +6FOFdXP2WDibAAALh3uQQ
 (envelope-from <chrubis@suse.cz>); Mon, 28 Jun 2021 13:34:13 +0000
Date: Mon, 28 Jun 2021 15:08:39 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <YNnJ18Q+cqb8zM5K@yuki>
References: <20210628033002.GA1469@andestech.com>
 <caf1bb46-5212-3c3d-f180-e722ef2cf8dd@jv-coder.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <caf1bb46-5212-3c3d-f180-e722ef2cf8dd@jv-coder.de>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] cgroup/cgroup_regression_test: Fix umount
 failure
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
Cc: richiejp@f-m.fm, metan@ucw.cz, alankao@andestech.com, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> I would like a short comment close to the syncs. When I converted 
> cpuset_regression_test.sh, I would have removed the sync in there, if 
> there wouldn't have been any comment.
> Most of the time syncs are not required and just added by paranoid 
> developers, but if there is a real reason, I think it should be stated 
> in a comment.

Sounds reasonable to me, can we please add a comment there?

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
