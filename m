Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C42867D843
	for <lists+linux-ltp@lfdr.de>; Thu, 26 Jan 2023 23:17:39 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 123B43CC7C8
	for <lists+linux-ltp@lfdr.de>; Thu, 26 Jan 2023 23:17:39 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 685573CC788
 for <ltp@lists.linux.it>; Thu, 26 Jan 2023 23:17:37 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 766351000BD6
 for <ltp@lists.linux.it>; Thu, 26 Jan 2023 23:17:35 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 6B5C821C34;
 Thu, 26 Jan 2023 22:17:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1674771455;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=M0XieSyaW+paWlFtiZAbApDEy6SYXHciAuMgNjtxAh0=;
 b=0RP4to8JeCB0p6wQ20nfRgY+7afU+NLUNTjo7eHdJmUQRTnFuM49vVXnmnHV8st3vspE2U
 sfCHtyyEQFFK3ZTdE3XgrklnJ/qaWjX1eWLGfM8GUEwYTfuvK/sWkh5gH9aJw9ATuiVxx/
 wFXq3A9WrOBCHMj5g+zbBLCamoAP/fk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1674771455;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=M0XieSyaW+paWlFtiZAbApDEy6SYXHciAuMgNjtxAh0=;
 b=Hs/H1//zQMXTXJvJeOS1FSlgJ/saNQH+Fx1DOhPf1rDz2WKUWtbqWhdNu/rVALK9SQZpug
 Y5xh/4gkBIfEodBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4554F139B3;
 Thu, 26 Jan 2023 22:17:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id yma9D//70mNFbQAAMHmgww
 (envelope-from <pvorel@suse.cz>); Thu, 26 Jan 2023 22:17:35 +0000
Date: Thu, 26 Jan 2023 23:17:33 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Wei Gao <wegao@suse.com>
Message-ID: <Y9L7/bn1XKb9JXAX@pevik>
References: <20230106113126.5304-1-wegao@suse.com>
 <20230111195231.23596-1-wegao@suse.com> <Y8EnKACJtJJ80uw+@pevik>
 <Y8Zbpfq8xcDZ2uZI@pevik> <Y8a8XH5TVsCvzhCF@aa>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y8a8XH5TVsCvzhCF@aa>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_SOFTFAIL
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v4] Add PATH to tst_rhost_run.sh
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
Cc: Richard Palethorpe <rpalethorpe@suse.com>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

> On Tue, Jan 17, 2023 at 09:26:13AM +0100, Petr Vorel wrote:
> > Hi Wei, all,

> > I at least once reproduced the problem:
> > # ./tst_rhost_run.sh
> > RTNETLINK answers: File exists
> > tst_rhost_run 1 TBROK: ip li add name ltp_ns_veth1 type veth peer name ltp_ns_veth2 failed

> > I can't reproduce it now, let's skip it.

> > Unfortunately there is another problem, which can't be solved with adjusting
> > PATH for the test, because also remote end would need to have PATH adjusted
> > With this patch and with your another patch [1]:

> > # ./tst_rhost_run.sh
> > ...
> > tst_rhost_run 1 TINFO: tst_rhost_run: cmd: tst_net_iface_prefix -r 10.0.0.1
> > tst_rhost_run 1 TINFO: NETNS: ns_exec 17258 net,mnt sh -c " tst_net_iface_prefix -r 10.0.0.1 || echo RTERR" 2>&1
> > ./../../../..//testcases/lib/tst_net.sh: line 1027: sh:: command not found
> > tst_rhost_run 1 TINFO: tst_rhost_run: cmd: tst_net_iface_prefix -r fd00:1:1:1::1
> > tst_rhost_run 1 TINFO: NETNS: ns_exec 17258 net,mnt sh -c " tst_net_iface_prefix -r fd00:1:1:1::1 || echo RTERR" 2>&1
> > ./../../../..//testcases/lib/tst_net.sh: line 1032: sh:: command not found
> > ...
> > tst_rhost_run 1 TPASS: tst_rhost_run is working

> > => test claims TPASS, but it actually does not work properly (false negative).

> > Therefore instead of adjusting PATH I want to fix it properly, i.e. moving
> > to testcases/kernel/containers/share/ (described previously).

> > Kind regards,
> > Petr

> > [1] https://patchwork.ozlabs.org/project/ltp/patch/20230117040132.5245-1-wegao@suse.com/

> Your failed case already not related my patch already since failed show "sh:: command not found", could you help check env such as
> "which sh" ,  "sh" normally should work in default system PATH, no need add specific PATH.

> But yes the test case claim PASS is wrong so we can further make improvement on this kind of error, such as add further check 
> for "sh" command then we will exit case and make result failed. I can add more check for "sh" command.

I thought "sh:: command not found" is for command missing (tst_net_iface_prefix
is actually missing), but probably not. But I also think that it's not related
to sh is missing, because the message has 'sh::' (double colon).

Anyway, I really think to concentrate on this broken test should come after
tst_net.sh cleanup is merged and netns helpers are moved to testcases/lib/.
1) These things are needed not just for shake of test 2) That will allow not to
add code which will be removed after cleanup.

Kind regards,
Petr


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
