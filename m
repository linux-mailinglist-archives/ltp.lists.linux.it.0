Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C1E67DD44F
	for <lists+linux-ltp@lfdr.de>; Tue, 31 Oct 2023 18:10:46 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 08E333CE9ED
	for <lists+linux-ltp@lfdr.de>; Tue, 31 Oct 2023 18:10:46 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id C47033CC972
 for <ltp@lists.linux.it>; Tue, 31 Oct 2023 18:10:44 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id C15431001848
 for <ltp@lists.linux.it>; Tue, 31 Oct 2023 18:10:42 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 728672184E;
 Tue, 31 Oct 2023 17:10:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1698772242; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5m23MEPye/MoiI29K2aZVnwtkmkkfULMbulYSCQfVuE=;
 b=m2mPE1gEGUmAL/AUP17Z38jxAh7kj9ec1JCkw8FCIPmQTBXQPsaBJIclObMyGO0M00VZyn
 mW5r5kbpnf4dh4kuDocD+C7ZAWREcEuoWVgHqo+vrUccaAiPX6ja3jNGPyp4IRkNBWz3d3
 pQSF/QBhwC64CEjuY8kPK1NQzXuseDw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1698772242;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5m23MEPye/MoiI29K2aZVnwtkmkkfULMbulYSCQfVuE=;
 b=ysaVGzEfTRBrrwqR12XN8Nl02Xlrs9eIAEjfYJIQyouE+KurUqvqSeoYhnUAuK/ynJrMLe
 li4p20kDdNughzBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5F3C11391B;
 Tue, 31 Oct 2023 17:10:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id dPTDFRI1QWWjagAAMHmgww
 (envelope-from <chrubis@suse.cz>); Tue, 31 Oct 2023 17:10:42 +0000
Date: Tue, 31 Oct 2023 18:11:13 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Richard Palethorpe <rpalethorpe@suse.de>
Message-ID: <ZUE1MWuiU63iK3IU@yuki>
References: <20230911094043.25511-1-andrea.cervesato@suse.de>
 <87edhrvx3r.fsf@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87edhrvx3r.fsf@suse.de>
X-Virus-Scanned: clamav-milter 1.0.1 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_SOFTFAIL,
 T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v1] Refactor getdtablesize01 using new LTP API
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
> > +static void setup(void)
> >  {
> > +	int fd;
> > +
> > +	fd = SAFE_CREAT(FILENAME, 0644);
> > +	SAFE_CLOSE(fd);
> >  }
> > +
> > +static struct tst_test test = {
> > +	.test_all = run,
> > +	.setup = setup,
> > +	.needs_tmpdir = 1,
> 
> This tests the underlying file system to some extent, so we should test
> all available file systems.

As far as I can tell it does not actually. This is a compatibility
function for od unixes and the name is literrally 'get descriptor table
size' so I suppose that it once returned the size of the array allocated
for the process to store file descritptors into.

So I supose that the only sensible approach is to call the function and
check that it returns a sane value.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
