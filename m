Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 032FA4BD9C5
	for <lists+linux-ltp@lfdr.de>; Mon, 21 Feb 2022 14:03:52 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3CD843CA160
	for <lists+linux-ltp@lfdr.de>; Mon, 21 Feb 2022 14:03:52 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 533FA3C21FF
 for <ltp@lists.linux.it>; Mon, 21 Feb 2022 14:03:48 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id B64E2600D43
 for <ltp@lists.linux.it>; Mon, 21 Feb 2022 14:03:47 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id DB5F11F390;
 Mon, 21 Feb 2022 13:03:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1645448626; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qpW+nUx/ERbtDOV/xCizqA1WpwzZMkL9xfb2KP8NzZQ=;
 b=nVMMIIQfelDGu17RjNk9CFGxEpQGdlt7gFdT6/N/PmD40UddpWWzoq+bw7mLsnLzJwGVeT
 eGFFe0AvDMXAb0zL4zkzS2xuZ9W7D48FCK+dv0PIPh3bEGbgUrLPbvmYCtCIjykQRRRaVR
 fClHaC0jLqZgyMro37ugag9AUZv0jh4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1645448626;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qpW+nUx/ERbtDOV/xCizqA1WpwzZMkL9xfb2KP8NzZQ=;
 b=+zcA1r8Ank9ULWHPO6PiQQxajBQDRFjDpu3Rbgo2WltX4xPeHWtFFyrsT+SmT7jYVbFvB/
 WtbzhhyZm9/VcADg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C662C13AD5;
 Mon, 21 Feb 2022 13:03:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id tjwjL7KNE2IaeAAAMHmgww
 (envelope-from <chrubis@suse.cz>); Mon, 21 Feb 2022 13:03:46 +0000
Date: Mon, 21 Feb 2022 14:05:56 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <YhOONDJPpHcX4bZW@yuki>
References: <20220218164845.11501-1-pvorel@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220218164845.11501-1-pvorel@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [RFC??[DO_NOT_MERGE][PATCH v2 1/1] netstress: Fix race
 between SETSID() and exit(0)
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
Cc: Martin Doucha <martin.doucha@suse.com>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
Uff, I did found the root cause after debugging for a while.

The network tests rely a lot on passing data between processes by files
by a local directory and .needs_checkpoints causes the test to run under
a different directory, that is because checkpoints needs a backing file
that is mapped into the process memory. And so after setting
.need_checkpoints the client was storing the file into a different
directory.

This should be a minimal fix:

diff --git a/testcases/lib/tst_net.sh b/testcases/lib/tst_net.sh
index 047686dc3..891472c8a 100644
--- a/testcases/lib/tst_net.sh
+++ b/testcases/lib/tst_net.sh
@@ -715,7 +715,7 @@ tst_netload()
        fi

        s_opts="${cs_opts}${s_opts}-R $s_replies -B $TST_TMPDIR"
-       c_opts="${cs_opts}${c_opts}-a $c_num -r $((c_requests / run_cnt)) -d $rfile"
+       c_opts="${cs_opts}${c_opts}-a $c_num -r $((c_requests / run_cnt)) -d $PWD/$rfile"

        tst_res_ TINFO "run server 'netstress $s_opts'"
        tst_res_ TINFO "run client 'netstress -l $c_opts' $run_cnt times"



However the debugging took longer than I wanted to since the network
tests are such a mess. The server does exit by TBROK (which looks like
it's an expected behavior), only half of the sever log is printed on a
failure, etc. These should really deserve some cleanups...

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
