Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id EC29D3C99E0
	for <lists+linux-ltp@lfdr.de>; Thu, 15 Jul 2021 09:48:54 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 671C33C8633
	for <lists+linux-ltp@lfdr.de>; Thu, 15 Jul 2021 09:48:54 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 9D82C3C65CD
 for <ltp@lists.linux.it>; Thu, 15 Jul 2021 09:48:50 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id E749F1000355
 for <ltp@lists.linux.it>; Thu, 15 Jul 2021 09:48:49 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 3ECC41FDE5;
 Thu, 15 Jul 2021 07:48:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1626335329;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/YQlH23lRxawc+5X0baezOoDGZ0yebnZ0zWl/q8PrrY=;
 b=aaWMux1PBRAvOU5X4TS5Rdq2hcOz4twNU4GvAis1O+BTJduIy0IbCm6aHr6UWsgNY38BLM
 bH2rdAK82fFDXjRhOa5esyL/E3A3G7f2TTCDc7VN15U2Q7Uw4qOiGt17tLZYSJlr1yP69Z
 aB3tR7+QgpAplr0kF8xrUXQVPzLbcj4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1626335329;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/YQlH23lRxawc+5X0baezOoDGZ0yebnZ0zWl/q8PrrY=;
 b=I82YQW3MXQumutiUE+dfQVEl+qg2MfMDl0VhUiKmS6eiJ0W3Rsw5X0HNdnA0C7nXFmlsv8
 pCe5Itlo0Tk/YeAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id BD9E113C2D;
 Thu, 15 Jul 2021 07:48:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id uN7sLGDo72B6aQAAMHmgww
 (envelope-from <pvorel@suse.cz>); Thu, 15 Jul 2021 07:48:48 +0000
Date: Thu, 15 Jul 2021 09:48:47 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>, ltp@lists.linux.it,
 Li Wang <liwang@redhat.com>, Joerg Vehlow <joerg.vehlow@aox-tech.de>,
 Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <YO/oX6ZvrbvR4Xrx@pevik>
References: <20210714142001.20566-1-pvorel@suse.cz> <YO70PiTdyxzTw0k2@pevik>
 <YO77+MmmxwMewgnQ@yuki> <YO8UIP310jsAmq8I@pevik>
 <YO/l6yni/AAOGhn9@pevik>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YO/l6yni/AAOGhn9@pevik>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v5 0/4] Run tests in CI
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Cyril,

...
> > Thanks! Testing it in https://github.com/pevik/ltp/actions/runs/1031005963

> The result is much better but still not correct:
> https://github.com/pevik/ltp/runs/3068932859?check_suite_focus=true#step:11:707

> runtest TINFO: * shell/net/tst_ipaddr_un.sh

> Summary:
> passed   0
> failed   0
> broken   0
> skipped  1
> warnings 0
> tst_ipaddr_un 1 TINFO: timeout per run is 0h 5m 0s

> Could you please merge your fix? And I'll try sync after each test.
> https://github.com/pevik/ltp/actions/runs/1033070696

There is still some output printed later, at least
In RPN: A B | C ! ! &
In RPN: A B | C ! ! &
which is from tst_bool_expr.c, but printed after tst_strstatus
https://github.com/pevik/ltp/runs/3074335940?check_suite_focus=true#step:11:587
But it's much better.

I also found a bug in final evaluation on one of my VM:

tst_test.c:1313: TBROK: Test killed by SIGSEGV!
...
runtest TINFO: 1x TBROK: tst_bool_expr
...
runtest TINFO: === FINAL TEST RESULTS ===
runtest TPASS: All C tests TCONF/TPASS <- THIS IS WRONG
runtest TPASS: All shell tests TCONF/TPASS

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
