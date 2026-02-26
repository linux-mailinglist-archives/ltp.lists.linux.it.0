Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
Delivered-To: lists+linux-ltp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yCWGLB2jn2lfdAQAu9opvQ
	(envelope-from <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>)
	for <lists+linux-ltp@lfdr.de>; Thu, 26 Feb 2026 02:34:21 +0100
X-Original-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 41A0419FD39
	for <lists+linux-ltp@lfdr.de>; Thu, 26 Feb 2026 02:34:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1772069660; h=date : to :
 message-id : references : mime-version : in-reply-to : subject :
 list-id : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : cc : content-type :
 content-transfer-encoding : sender : from;
 bh=6asNLdj57wKsjdC8/PnK3rPz7ZvjMvKX5zQfLo+s5dc=;
 b=FbI1W8C6WabMF3drUPmbng4A5guglzmcomuBib7E2VyJCYbXJ8Yq73xiIhU8NjydmFX9W
 YUgIqKGgNtWD6vak0tLMO880lKM/olaenLUWNfDre5Ui6pl1vy0DE7ELRBISsOVEV2LW1Go
 FrjDmRRyh0cD5jbI2fEKl55dC5MA4tg=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E393F3CB3C9
	for <lists+linux-ltp@lfdr.de>; Thu, 26 Feb 2026 02:34:20 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id BD6793CB0A5
 for <ltp@lists.linux.it>; Thu, 26 Feb 2026 02:34:08 +0100 (CET)
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 2897F140006F
 for <ltp@lists.linux.it>; Thu, 26 Feb 2026 02:34:08 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-483a233819aso3464585e9.3
 for <ltp@lists.linux.it>; Wed, 25 Feb 2026 17:34:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1772069647; x=1772674447; darn=lists.linux.it;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=AF9Q/4Uyk45AsTEW5/c7HF445UibJ0GTv4YduOf5XFg=;
 b=B4/SvaXjZoJOffxFtq3MfdqvTqp/GtmHxxnlnPwxtMyqZNGsEMWMZSBYzuf5NWBHgV
 vLAy5OFHC6mb04QGFcaYhknuinLGtjCegBdq4PcLqADJzefDNSN7qdROLAnfGpfi0iTY
 k6cNSPbsDS6ELP5bnyHiLOgGAzx28zJRDb0j9LCB80bge8ZP0CQi2zMUHN97iirhbLOY
 tA+1b5fKOhFwaNo/NByWsL4VlOKhswn+Sb4apzMGvtjEGgnvK0KDF7592+MTmyPF4XXY
 /L1vyp5I/4XOMKcsDulHVqV/hX6jd8DJsyYd2b16e3yJXp2095V57SmtbTsA99UNKlJF
 vQ7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772069647; x=1772674447;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AF9Q/4Uyk45AsTEW5/c7HF445UibJ0GTv4YduOf5XFg=;
 b=S3pU50ZxfHujIQRMkVo6fOYnxQ+eV/WeKb7hUNvUYh3hKFODC8lYZNL+Jq0MzTq6pV
 mDOCA7F9hx+Np9i0AlzRFPCrJHnrXai/V00U261teKuYc5yTHKtejCBrK4NKtcqbmnVr
 3ZX/bEQffrULHxfcPzsc1PSQg7/LbolRgepaCc+uAlIugAZB1ItxiihD8qES+mH0NCF3
 ns5zOppCC80DteRt4koge9rN7VFCgxZSXtFBYCPHjB7acz3r8qO6sVVwSRqK3b50zQ3i
 tRQmW7/hrsMO4vMllJeDiYwf0lnYDCp86cD2X0s0CgBZ1pbmEsKgYShh649fwcDHHY22
 hgBA==
X-Gm-Message-State: AOJu0YxUo87htNe4OY8vC1ZTL2oIWGtVCMWeSs0cixtkTJAHmvrE0j9d
 voRLb/wWqscf63HuJPYwNwAThNTSVutXF1J9dxG5PIVwcHfot/A2WZvgCH1pzckFow==
X-Gm-Gg: ATEYQzx+0vQBbLtnwNusCfvluBKEU3pOVkzisHLvI1H8pcujIsMppqS3oKq9Kg+Mais
 ghZCwby3cZXWKQUYhzkPAmA2S+ervWmcBrQNyWMwX7J4NF8HcN6IVpGsA9DQ7a3M9mcsGm5CaAA
 ZC5l+lfnMRVD/IXLxF68Whm5q5EpNItXzs60lPHn8HmBMyFJgW/8Oz+y5A8ZGmNtZ4651PbIqWL
 9bQ+RMgVVGeytQ/opL803gWUwJJoB32S5p7fBNbNrkxRiRfhlloB5Vided8fmjbQ9Hsmd2cAiPc
 F447HRRg1tfEcUZQvO3lzJ6FrR/WuCo1B9rjM+A7pcjlta417DK9b8CFME6g/paePC9du+UJlPH
 n7AiTwYjODl61BiCZdp3/fLWJWUaDXr3alQjH89irdkOl+ea7BEMRJ2OvEW5VFUEX0BCQGjNCQS
 bSaECP/sxyIcXlijR8XjAa1WMDCgwrJRGUC+BvuOeb
X-Received: by 2002:a05:600c:5250:b0:483:71f7:2782 with SMTP id
 5b1f17b1804b1-483c3db88d8mr5667365e9.12.1772069647371; 
 Wed, 25 Feb 2026 17:34:07 -0800 (PST)
Received: from autotest-wegao.qe.prg2.suse.org
 ([2a07:de40:b240:0:2ad6:ed42:2ad6:ed42])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483c3b770c2sm9192805e9.10.2026.02.25.17.34.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Feb 2026 17:34:06 -0800 (PST)
Date: Thu, 26 Feb 2026 01:34:05 +0000
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <aZ-jDRXSWK78VmdE@autotest-wegao.qe.prg2.suse.org>
References: <20251125044057.20922-1-wegao@suse.com>
 <20260225015044.19233-1-wegao@suse.com> <aZ7V7XD6LIiZ4m0e@yuki.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aZ7V7XD6LIiZ4m0e@yuki.lan>
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-6.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH v4] tst_tmpdir: Fix buffer overflow in tst_tmpdir.c
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
From: Wei Gao via ltp <ltp@lists.linux.it>
Reply-To: Wei Gao <wegao@suse.com>
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.21 / 15.00];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+a];
	R_DKIM_ALLOW(-0.20)[lists.linux.it:s=picard];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[lists,linux-ltp=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.linux.it,none];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	R_DKIM_REJECT(0.00)[suse.com:s=google];
	DKIM_TRACE(0.00)[lists.linux.it:+,suse.com:-];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-ltp];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[ltp@lists.linux.it,ltp-bounces@lists.linux.it];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:12779, ipnet:2001:1418::/29, country:IT];
	HAS_REPLYTO(0.00)[wegao@suse.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.linux.it:dkim,suse.com:replyto,suse.cz:email]
X-Rspamd-Queue-Id: 41A0419FD39
X-Rspamd-Action: no action

On Wed, Feb 25, 2026 at 11:58:53AM +0100, Cyril Hrubis wrote:
> Hi!
> > @@ -183,8 +186,7 @@ static int purge_dir(const char *path, char **errptr)
> >  			continue;
> >  
> >  		/* Recursively remove the current entry */
> > -		sprintf(dirobj, "%s/%s", path, dir_ent->d_name);
> > -		if (rmobj(dirobj, errptr) != 0)
> > +		if (rmobjat(subdir_fd, dir_ent->d_name, errptr) != 0)
> >  			ret_val = -1;
> >  	}
> 
> Shouldn't we close(subdir_fd) here as well?
I guess you mean following change? Then i think adding close(subdir_fd) inside loop will actually cause a double-close, 
since after for loop there is another closedir(dir) will be called. closedir will also try closes underlying file descriptor.
Correct me if any mistake, thanks.

diff --git a/lib/tst_tmpdir.c b/lib/tst_tmpdir.c
index 9b024a74e..0c06a306c 100644
--- a/lib/tst_tmpdir.c
+++ b/lib/tst_tmpdir.c
@@ -186,8 +186,10 @@ static int purge_dirat(int dir_fd, const char *path, char **errptr)
                        continue;
 
                /* Recursively remove the current entry */
-               if (rmobjat(subdir_fd, dir_ent->d_name, errptr) != 0)
+               if (rmobjat(subdir_fd, dir_ent->d_name, errptr) != 0) {
+                       close(subdir_fd);  <<<<<<<<<< first close
                        ret_val = -1;
+               }
        }
        
        closedir(dir);  <<<<<<<<<<<<< second close
        return ret_val;
> 
> > @@ -192,63 +194,53 @@ static int purge_dir(const char *path, char **errptr)
> >  	return ret_val;
> >  }
> >  
> 
> The rest seems to be fine.
> 
> -- 
> Cyril Hrubis
> chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
