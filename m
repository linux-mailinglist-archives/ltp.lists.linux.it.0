Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id A17143ACAB0
	for <lists+linux-ltp@lfdr.de>; Fri, 18 Jun 2021 14:18:48 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 699F53C2CD6
	for <lists+linux-ltp@lfdr.de>; Fri, 18 Jun 2021 14:18:48 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id AB2683C1B48
 for <ltp@lists.linux.it>; Fri, 18 Jun 2021 14:18:46 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id A7D7B20108D
 for <ltp@lists.linux.it>; Fri, 18 Jun 2021 14:18:45 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 09E1C1FD8F;
 Fri, 18 Jun 2021 12:18:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1624018725; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MABju9i2qIqLkeWGW6ZoopBfLZuCQlfpzrqw70BLAMI=;
 b=xRq+BJd+P4c4EaCrf3CNK0J2kREXOovbYpfjPmYTwgEZXXrxP75YUzOclYKSoAhK8gbh5d
 N0qOuIvPqEAEGwF4IzNcKIN7kYLcYC47aRE78Gws0t4nw6z6Psv8J/vkS2FK8Y2m93Mc27
 BibABNijCi6QwT0BBMYQ0kE+EGGPS2Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1624018725;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MABju9i2qIqLkeWGW6ZoopBfLZuCQlfpzrqw70BLAMI=;
 b=V+0gY+652H4QL7dcxIj8Mc8hFVqz6M01aTr09yEfowhZ33jvZCF7ljCvPt9AR3SciCtthH
 d6f/6iVCnxS0rSDA==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id DE8DB118DD;
 Fri, 18 Jun 2021 12:18:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1624018725; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MABju9i2qIqLkeWGW6ZoopBfLZuCQlfpzrqw70BLAMI=;
 b=xRq+BJd+P4c4EaCrf3CNK0J2kREXOovbYpfjPmYTwgEZXXrxP75YUzOclYKSoAhK8gbh5d
 N0qOuIvPqEAEGwF4IzNcKIN7kYLcYC47aRE78Gws0t4nw6z6Psv8J/vkS2FK8Y2m93Mc27
 BibABNijCi6QwT0BBMYQ0kE+EGGPS2Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1624018725;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MABju9i2qIqLkeWGW6ZoopBfLZuCQlfpzrqw70BLAMI=;
 b=V+0gY+652H4QL7dcxIj8Mc8hFVqz6M01aTr09yEfowhZ33jvZCF7ljCvPt9AR3SciCtthH
 d6f/6iVCnxS0rSDA==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id LjUgNSSPzGC1EQAALh3uQQ
 (envelope-from <chrubis@suse.cz>); Fri, 18 Jun 2021 12:18:44 +0000
Date: Fri, 18 Jun 2021 13:53:07 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Xie Ziyao <xieziyao@huawei.com>
Message-ID: <YMyJI2o3+MAeqGBr@yuki>
References: <20210617105556.130869-1-xieziyao@huawei.com>
 <20210617105556.130869-3-xieziyao@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210617105556.130869-3-xieziyao@huawei.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/3 v2] lib: tst_process_state: Add
 tst_process_exit_wait()
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
Looks good.

Reviewed-by: Cyril Hrubis <chrubis@suse.cz>

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
