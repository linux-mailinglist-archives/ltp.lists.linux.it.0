Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id C54EA445AA8
	for <lists+linux-ltp@lfdr.de>; Thu,  4 Nov 2021 20:40:52 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9C11E3C753F
	for <lists+linux-ltp@lfdr.de>; Thu,  4 Nov 2021 20:40:51 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 9039E3C7186
 for <ltp@lists.linux.it>; Thu,  4 Nov 2021 20:40:47 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 7DE44600703
 for <ltp@lists.linux.it>; Thu,  4 Nov 2021 20:40:46 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 759101FD35;
 Thu,  4 Nov 2021 19:40:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1636054845;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gbf3hHqSDhvsEABTC/AIwcwBrrpNjXQB8/nZypfUQwc=;
 b=o6S7GJ6HZDN7LnCK0CvO4CdtGGZhsz3yxAxNnwcFrs2fJJrwqDu+lwL1cTbPeAssYUQY8Q
 aPChYkhCYKzUawOfg9URxwO+b3eNpuydCeX4OkZ5aPdTDINfwXSQa3XMU/VmxfGdkT8Q2w
 wrZNdFR4S4JY4IXJxcn7xGNnrJuIicg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1636054845;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gbf3hHqSDhvsEABTC/AIwcwBrrpNjXQB8/nZypfUQwc=;
 b=vqYtwZ8M0OI4ac56OiBdx7GRkK8mzrYvwV/zgxiHA8PpUCltoSfHvc1V5kW75tB4ghXei7
 iKIKqV74lXosTBBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 448C713FCF;
 Thu,  4 Nov 2021 19:40:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id mmACDz03hGHzXgAAMHmgww
 (envelope-from <pvorel@suse.cz>); Thu, 04 Nov 2021 19:40:45 +0000
Date: Thu, 4 Nov 2021 20:40:43 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <YYQ3O3XYoZ88GBBN@pevik>
References: <20211103120233.20728-1-chrubis@suse.cz>
 <20211103120233.20728-8-chrubis@suse.cz> <YYKI9I05hEjiKNiE@pevik>
 <YYKLnxZL44ftguOx@yuki> <YYKMIuHDheI1PK8x@yuki>
 <YYKe0sdsN/qGRO8E@pevik> <YYKmqo3NCZi35DKB@pevik>
 <YYKsVYjYm0lk8cpD@yuki> <YYPb0HgsJ0YEZ9PB@yuki>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YYPb0HgsJ0YEZ9PB@yuki>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3 7/7] docparse: Split into metadata and docparse
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
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

> Hi!
> And I did a CI run with the correct version at:

> https://github.com/metan-ucw/ltp/actions/runs/1421302973
Thanks!

Reviewed-by: Petr Vorel <pvorel@suse.cz>

I'd still appreciate make in docparse/ directory could somehow resolve miss=
ing
dependency, but I can live without it as it's obviously meant to run make o=
nly
in metadata/ directory.

$ cd docparse/
$ make
make: *** No rule to make target 'ltp/metadata/ltp.json', needed by 'txt'. =
 Stop.
[2] =C8t lis 04 20:34 W ltp/docparse (metan/docparse-improvements.v4.fixes)=
 $ cd ../metadata/

$ make
HOSTCC metadata/metaparse
ltp/metadata/parse.sh > ltp.json
mkdir -p ltp/docparse
make -C ltp/docparse/ -f ltp/docparse/Makefile
make[1]: Entering directory 'ltp/docparse'
ltp/docparse/testinfo.pl ltp/metadata/ltp.json
INFO: using '../linux' as LINUX_GIT repository
WARN: $LINUX_STABLE_GIT does not exit ('../linux-stable')
INFO: using '../glibc' as GLIBC_GIT repository
asciidoctor -d book metadata.txt -b xhtml
make[1]: Leaving directory 'ltp/docparse'

Kind regards,
Petr

-- =

Mailing list info: https://lists.linux.it/listinfo/ltp
