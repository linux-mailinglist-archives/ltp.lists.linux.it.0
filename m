Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E14C3C7276
	for <lists+linux-ltp@lfdr.de>; Tue, 13 Jul 2021 16:40:59 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 185E63C8781
	for <lists+linux-ltp@lfdr.de>; Tue, 13 Jul 2021 16:40:59 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 52D283C6A26
 for <ltp@lists.linux.it>; Tue, 13 Jul 2021 16:40:55 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 8B8F5600147
 for <ltp@lists.linux.it>; Tue, 13 Jul 2021 16:40:54 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id DE25B201E7;
 Tue, 13 Jul 2021 14:40:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1626187253; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QhsMXP/WmfIMVPfby2865Oq/E1+U6/hcIBODZNx8Ryo=;
 b=r1HsfmFKCkdkPyKMIrFkwWdZGeV8BcDV/exdlZpA1GpJXOfKuybIS0czWYd9MHWQkWVzz7
 JEiYkUVEkNvmDstakqz0zku1p7RlmlUkfDTUEDaaNO7KazBwYoljKl5GxKM11KY13nSySi
 hghu8fXN4frTll98RNvoGjEM2W3UVkg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1626187253;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QhsMXP/WmfIMVPfby2865Oq/E1+U6/hcIBODZNx8Ryo=;
 b=ik1oockqraV0h55Nmv//vOwW+m4bSupB8Oqs/tFedRnk2ebpekqHT70dgR78xSmqyVXE9L
 YFv1ESn4QXpUnLBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C44F113AF0;
 Tue, 13 Jul 2021 14:40:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id HZKWL/Wl7WB3KAAAMHmgww
 (envelope-from <chrubis@suse.cz>); Tue, 13 Jul 2021 14:40:53 +0000
Date: Tue, 13 Jul 2021 16:15:20 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <YO2f+P8Z9l6SISDG@yuki>
References: <20210713101338.6985-1-pvorel@suse.cz>
 <20210713101338.6985-5-pvorel@suse.cz> <YO2T4J14roLUT32t@yuki>
 <YO2gUL2/s29SGdNo@pevik>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YO2gUL2/s29SGdNo@pevik>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v4 4/7] lib: Add script for running tests
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
Cc: Joerg Vehlow <joerg.vehlow@aox-tech.de>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> Thanks! It looks like it helped (but few jobs haven't finished yet).
> https://github.com/pevik/ltp/actions/runs/1026771350
> Will you merge this fix yourself please?

It was obvious bug in the code, so I pushed it with yours Reported-by and
Tested-by.

> > Not sure what we can do here, I guess that timings would be hard to fix
> > on VMs that run the tests.
> 
> If I remember correctly Richie suggested that FAIL is also OK. He said only
> TBROK and TCONF is a problem. I'd prefer to fuzzy sync tests which always pass,
> but after this effort I can work on API tests metadata, which would allow also
> this.

Another possibility would be relaxing the timings on VMs. I guess that
we could change the treshold for reaching the criticall section to 10 on
VMs.

> > > +# custom version
> > > +tst_res()
> > > +{
> > > +	if [ $# -eq 0 ]; then
> > > +		echo >&2
> > > +		return
> > > +	fi
> > > +
> > > +	local res="$1"
> > > +	shift
> > > +
> > > +	tst_color_enabled
> > > +	local color=$?
> > > +
> > > +	printf "runtest " >&2
> > > +	tst_print_colored $res "$res: " >&2
> > > +	echo "$@" >&2
> > > +
> > > +}
> > > +
> > > +# custom version
> > > +tst_brk()
> > > +{
> > > +	local res="$1"
> > > +	shift
> > > +
> > > +	tst_flag2mask "$res"
> > > +	local mask=$?
> > > +
> > > +	tst_res
> > > +	tst_res $res $@
> > > +
> > > +	exit $mask
> > > +}
> 
> > I'm not sure that we should call these function tst_res and tst_brk it
> > only confuses everything since these are different from the ones in the
> > test library.
> OK, I'll rename it (runtest_res() and runtest_brk()).
> 
> > > +run_tests()
> > > +{
> > > +	local target="$1"
> > > +	local i ret tconf tpass vars
> > > +
> > > +	eval vars="\$LTP_${target}_API_TESTS"
> > > +
> > > +	tst_res TINFO "=== Run $target tests ==="
> > > +
> > > +	for i in $vars; do
> > > +		tst_res TINFO "* $i"
> > > +		./$i
> > > +		ret=$?
> > > +
> > > +		case $ret in
> > > +			0) tpass="$tpass $i";;
> > > +			1) tst_brk TFAIL "$i failed with TFAIL";;
> > > +			2) tst_brk TFAIL "$i failed with TBROK";;
> > > +			4) tst_brk TFAIL "$i failed with TWARN";;
> > > +			32) tconf="$tconf $i";;
> > > +			127) tst_brk TBROK "Error: file not found (wrong PATH? out-of-tree build without -b?), exit code: $ret";;
> > > +			*) tst_brk TBROK "Error: unknown failure, exit code: $ret";;
> 
> > Why do we exit on failure here?
> 
> > We should just increase the fail counters and go ahead with next test.
> 
> I quit here because you know how hard is to find error in very long log
> file. Also why to waste developer time when some test failed? Similar approach
> make has. But sure, I can continue here and print summary at the end.

As long as we run it on CI we really should run all tests.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
