Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 18ABA3F7158
	for <lists+linux-ltp@lfdr.de>; Wed, 25 Aug 2021 11:00:51 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D25A23C3015
	for <lists+linux-ltp@lfdr.de>; Wed, 25 Aug 2021 11:00:50 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 7E2AA3C2F5A
 for <ltp@lists.linux.it>; Wed, 25 Aug 2021 11:00:48 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 279FC6018B8
 for <ltp@lists.linux.it>; Wed, 25 Aug 2021 11:00:32 +0200 (CEST)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 5E0B522118;
 Wed, 25 Aug 2021 09:00:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1629882032;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TSIjOU9HoG+HrLjIxsLowx69g9HN7bIqW6YFpr8ypgM=;
 b=jUX0XYWRnnKX+X43CcKoiUYQ3odpldb+vdgf+hUJQveMQRuiDBH4zXVeOahl7NPknkzLN+
 ve3nCQXju4q/N5ZJhu+pD+iaVAOu7OXdC4oyZ57pmfzj2V6xqKEayQYbtVDxD3sPzCg34M
 8KnmUNG5r/9pKCBan8k6Rc/qHJ0PYrQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1629882032;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TSIjOU9HoG+HrLjIxsLowx69g9HN7bIqW6YFpr8ypgM=;
 b=MSUM/n+UyqGlYWag300S8rWvHV2o09aSL1fjqnnqu3+7G419I9l4ynXF6RCoZvy3dKnpx/
 mQP3aQRsWx7vtmDQ==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 311D313732;
 Wed, 25 Aug 2021 09:00:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id IBRPCrAGJmE0fQAAGKfGzw
 (envelope-from <pvorel@suse.cz>); Wed, 25 Aug 2021 09:00:32 +0000
Date: Wed, 25 Aug 2021 11:00:30 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <YSYGrt7xn32GxeUm@pevik>
References: <20210825080933.12949-1-pvorel@suse.cz>
 <20210825080933.12949-3-pvorel@suse.cz>
 <ba968568-5f0d-07f8-e5df-78f62148a3da@jv-coder.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ba968568-5f0d-07f8-e5df-78f62148a3da@jv-coder.de>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/3] C API: Rename LTP_IPC_PATH -> TST_IPC_PATH
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
Cc: Joerg Vehlow <joerg.vehlow@aox-tech.de>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Joerg,

...
> > NOTE: IPC is not supported in the legacy API.
> Do you mean legacy c api here? It is supported. See old_checkpoints.h.
Ah good, point, thanks! (include/old/old_checkpoint.h). But if I look correctly,
LTP_IPC_PATH is not used there, right?

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
