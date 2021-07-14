Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3307D3C861C
	for <lists+linux-ltp@lfdr.de>; Wed, 14 Jul 2021 16:27:15 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E33DF3C865C
	for <lists+linux-ltp@lfdr.de>; Wed, 14 Jul 2021 16:27:14 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 8881D3C7565
 for <ltp@lists.linux.it>; Wed, 14 Jul 2021 16:27:13 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id C4EC91A001C9
 for <ltp@lists.linux.it>; Wed, 14 Jul 2021 16:27:12 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 07550202BE;
 Wed, 14 Jul 2021 14:27:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1626272832;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kZvSH1PZ3sqriu9vN+gcRVtcF6yt1nQXDRUtTh6pDpE=;
 b=cS6zVq9TYvpm8lmD9WmlpsQl9THjMiydTzUFlzCrSCls1AELdob+CDDHCov5Jf7oWvw/Fl
 AypDk8qfeg0vOyXHeP8s9gBS98iF+y1jsHu8khO3qPkzzDPPAy+cBUNVfVrMQyE348/4kz
 2xx3ZgDTXipChUDUMFJOO1YbPZ1G5iU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1626272832;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kZvSH1PZ3sqriu9vN+gcRVtcF6yt1nQXDRUtTh6pDpE=;
 b=f14ZhTJD5FLgtayuntD8y9gNoQ5jBrPY7prmYW5sXEQpq57Xk+7yWnuZgis0R+Z0+e3zbW
 YQetjPnSIaF2eJAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C444413C05;
 Wed, 14 Jul 2021 14:27:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Go1iLj/07mCceAAAMHmgww
 (envelope-from <pvorel@suse.cz>); Wed, 14 Jul 2021 14:27:11 +0000
Date: Wed, 14 Jul 2021 16:27:10 +0200
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Message-ID: <YO70PiTdyxzTw0k2@pevik>
References: <20210714142001.20566-1-pvorel@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210714142001.20566-1-pvorel@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
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
Cc: Joerg Vehlow <joerg.vehlow@aox-tech.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi all,

tested:
https://github.com/pevik/ltp/actions/runs/1030551185

One thing which bothers me is mangled output of several tests together:
https://github.com/pevik/ltp/runs/3067600696?check_suite_focus=true#step:11:554

runtest TINFO: * tst_res_hexd
/__w/ltp/ltp/lib/tst_test.c:1344: TINFO: Timeout per run is 0h 05m 00s
/__w/ltp/ltp/lib/newlib_tests/tst_res_hexd.c:13: TPASS: dump1
/__w/ltp/ltp/lib/newlib_tests/tst_res_hexd.c:13: TPASS: 48 65 6c 6c 6f 20 66 72 6f 6d 20 74 73 74 5f 72
/__w/ltp/ltp/lib/newlib_tests/tst_res_hexd.c:13: TPASS: 65 73 5f 68 65 78 64 00

runtest TINFO: * tst_strstatus
/__w/ltp/ltp/lib/tst_test.c:1344: TINFO: Timeout per run is 0h 05m 00s

Summary:
passed   35
failed   0
broken   0
skipped  0
warnings 0

Summary:
passed   1
failed   0
broken   0
skipped  0
warnings 0

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
