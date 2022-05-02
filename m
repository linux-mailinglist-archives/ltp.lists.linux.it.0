Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 03C985170E9
	for <lists+linux-ltp@lfdr.de>; Mon,  2 May 2022 15:50:10 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7DB703CA83A
	for <lists+linux-ltp@lfdr.de>; Mon,  2 May 2022 15:50:09 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id C92A33CA44D
 for <ltp@lists.linux.it>; Mon,  2 May 2022 15:50:07 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id DB5562001B3
 for <ltp@lists.linux.it>; Mon,  2 May 2022 15:50:06 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id CC1F41F747;
 Mon,  2 May 2022 13:50:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1651499405;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=eUn/Ltvhla74bCph8zJ8mYl7qGaw4OLymSwk4RWv01c=;
 b=AW8P9cqH+ZklHYWgosQLAwlr2NeSLKsSZY95V9idiN/4YyRrOTzC6qazX0MUDqsrNlvpay
 C8X5t2JDapDrhNIY2OQsujqgEQ/TvpYjjeyyiRfHKUAw9Q6pwONeB1tzl9BRCCfMqNxwc3
 xCYVRQS83bzMc9w4XEv3eART9bpofwU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1651499405;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=eUn/Ltvhla74bCph8zJ8mYl7qGaw4OLymSwk4RWv01c=;
 b=l2nFiRg1VA1kGkFNhVNJYHlnPt7bSPzH38AzC2SsDTUWfj2eWVU5Er05KQF4UjGo2j5Ea9
 r0tqpRDCnYIZ0BAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9502113491;
 Mon,  2 May 2022 13:50:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id PImBIo3hb2LiIQAAMHmgww
 (envelope-from <pvorel@suse.cz>); Mon, 02 May 2022 13:50:05 +0000
Date: Mon, 2 May 2022 15:50:03 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Martin Doucha <mdoucha@suse.cz>
Message-ID: <Ym/hi05AYBqtifLO@pevik>
References: <20220428065657.32046-1-pvorel@suse.cz>
 <539e2eb7-05d5-470c-3287-b1e9b7220532@suse.cz>
 <Ymwp2cilZtjn+g3y@pevik>
 <cfabdc28-fef8-576f-7845-630a443833d1@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cfabdc28-fef8-576f-7845-630a443833d1@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3 5/5] busy_poll: Move TST_{SETUP,
 CLEANUP} to the tests
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

Hi Martin,

> On 29. 04. 22 20:09, Petr Vorel wrote:
> > I was thinking about it as well. Makes sense, but then it hides the fact that
> > busy_poll_lib.sh contain other API variables (missing TST_TESTFUNC suggest that
> > there are some variables in busy_poll_lib.sh). Anyway, I'm ok to move it there
> > as well, just document that sharing variables between library and test will be
> > always a bit problematic.

> Now that you mention the other variables in busy_poll_lib.sh, I guess
> that TST_MIN_KVER and TST_NEEDS_CMDS should use conditional expansion so
> that the values can be changed in the tests.
Makes sense. But I'd probably prefer to postpone this commit,
because TST_NEEDS_CMDS will be in more shell libraries.
Because even this cleanup so far wasn't my intention, I'd prefer to get it
merged soon so that I can post rebased fixes for tst_net.sh with disabled IPv6
(to get them merged before release).

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
