Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 79B683A1E38
	for <lists+linux-ltp@lfdr.de>; Wed,  9 Jun 2021 22:45:10 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 450C23C8FF5
	for <lists+linux-ltp@lfdr.de>; Wed,  9 Jun 2021 22:45:10 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 663A43C7AE0
 for <ltp@lists.linux.it>; Wed,  9 Jun 2021 22:45:08 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 401FF601CF8
 for <ltp@lists.linux.it>; Wed,  9 Jun 2021 22:45:07 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 384AB1FD5E;
 Wed,  9 Jun 2021 20:45:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1623271507;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=iPPts/rrC2YHFFMS58Odd+6oc82+YA1903mbnkBIbA4=;
 b=Ag0jn02NNTWcjZlowUsFehUTCtvIl60RAAxopf+tcpHsd9f4p3rWwAdIN9OtXJJS/4r0v0
 Va8Mj0WdJdqsNRC5GmZaKoBlyZIu7/onhG5R0Qa4FF3stu2teJ9LkeDBSoKdKKEQ7GhDXr
 BX7VufO5mCJa4wuyVT1AR87jw5qLkMo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1623271507;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=iPPts/rrC2YHFFMS58Odd+6oc82+YA1903mbnkBIbA4=;
 b=SkFAWR9ZpW7vltIhevFvOQPUogy/VsFtnIPg9Tlvpj7eDvWcDmsiCB0bTkwJBveOl/x53s
 06QxKRalUpatV6DA==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 0A977118DD;
 Wed,  9 Jun 2021 20:45:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1623271507;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=iPPts/rrC2YHFFMS58Odd+6oc82+YA1903mbnkBIbA4=;
 b=Ag0jn02NNTWcjZlowUsFehUTCtvIl60RAAxopf+tcpHsd9f4p3rWwAdIN9OtXJJS/4r0v0
 Va8Mj0WdJdqsNRC5GmZaKoBlyZIu7/onhG5R0Qa4FF3stu2teJ9LkeDBSoKdKKEQ7GhDXr
 BX7VufO5mCJa4wuyVT1AR87jw5qLkMo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1623271507;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=iPPts/rrC2YHFFMS58Odd+6oc82+YA1903mbnkBIbA4=;
 b=SkFAWR9ZpW7vltIhevFvOQPUogy/VsFtnIPg9Tlvpj7eDvWcDmsiCB0bTkwJBveOl/x53s
 06QxKRalUpatV6DA==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id E/8MAVMowWDwBQAALh3uQQ
 (envelope-from <pvorel@suse.cz>); Wed, 09 Jun 2021 20:45:07 +0000
Date: Wed, 9 Jun 2021 22:45:00 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Xie Ziyao <xieziyao@huawei.com>
Message-ID: <YMEoTApQgwz+eakI@pevik>
References: <20210609094924.145262-1-xieziyao@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210609094924.145262-1-xieziyao@huawei.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 0/2] syscalls/chown: Format output and add
 testcases for chown05
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

Hi Ziyao,

> 1. Format output and add testcases for chown05.
> 2. Delete duplicate header files.

> Xie Ziyao (2):
>   syscalls/chown: format output and add testcases for chown05
>   syscalls/chown: format output and delete duplicate header files

Thanks a lot, merged!

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
