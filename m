Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 365DE3AC619
	for <lists+linux-ltp@lfdr.de>; Fri, 18 Jun 2021 10:28:55 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E69B73C2A8E
	for <lists+linux-ltp@lfdr.de>; Fri, 18 Jun 2021 10:28:54 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 9C8343C2173
 for <ltp@lists.linux.it>; Fri, 18 Jun 2021 10:28:53 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id CF69C6010F4
 for <ltp@lists.linux.it>; Fri, 18 Jun 2021 10:28:52 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 32EB21FDAE;
 Fri, 18 Jun 2021 08:28:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1624004932; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2Um/E8lvrC8aJnpCDmyUTZHjiUZxPcZlvl0RJcB8gJU=;
 b=USF4N7wWhexadrN+Q5pfzybcrsGwn2kea4GaffREyIgEc/vpT+gfkmpdJAipRC7gROlcFc
 9S0vATWlJa7WrPHzWOPSfDQWpoIrt2wmHeGhcfydfZUXgBQf+gMYwXviY9AfYdCjXAB/wQ
 tXRagBF//KhLi0NSKWDN3dgQyJ2ZMDk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1624004932;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2Um/E8lvrC8aJnpCDmyUTZHjiUZxPcZlvl0RJcB8gJU=;
 b=ENVI/5xUoV2lUsDEG/mrkX/jnHp4UBRi1WzpJep4D54e7kENINgEnWcmvHNHXx6rOF6MK1
 k4sHFa9bm/0g4YAA==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 17109118DD;
 Fri, 18 Jun 2021 08:28:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1624004932; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2Um/E8lvrC8aJnpCDmyUTZHjiUZxPcZlvl0RJcB8gJU=;
 b=USF4N7wWhexadrN+Q5pfzybcrsGwn2kea4GaffREyIgEc/vpT+gfkmpdJAipRC7gROlcFc
 9S0vATWlJa7WrPHzWOPSfDQWpoIrt2wmHeGhcfydfZUXgBQf+gMYwXviY9AfYdCjXAB/wQ
 tXRagBF//KhLi0NSKWDN3dgQyJ2ZMDk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1624004932;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2Um/E8lvrC8aJnpCDmyUTZHjiUZxPcZlvl0RJcB8gJU=;
 b=ENVI/5xUoV2lUsDEG/mrkX/jnHp4UBRi1WzpJep4D54e7kENINgEnWcmvHNHXx6rOF6MK1
 k4sHFa9bm/0g4YAA==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id L52oBERZzGCnBQAALh3uQQ
 (envelope-from <chrubis@suse.cz>); Fri, 18 Jun 2021 08:28:52 +0000
Date: Fri, 18 Jun 2021 10:03:14 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <YMxTQliOqBJsYZcu@yuki>
References: <20210603033611.15619-1-xieziyao@huawei.com>
 <20210603033611.15619-3-xieziyao@huawei.com>
 <YMurRVXwyvKXnkjj@pevik>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YMurRVXwyvKXnkjj@pevik>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/3] syscalls/sendfile: Convert sendfile06 to the
 new API
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
> > 1. Convert sendfile06 to the new API with file descriptors instead
> > of socket descriptors.
> I wonder if this is ok, suppose yes, but better if other check.

In kernels before 2.6.33 out_fd had to be a socket. Kernel 2.6.33 went
out somewhere in 2010 which should be more than old enough.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
