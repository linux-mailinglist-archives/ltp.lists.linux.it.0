Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
Delivered-To: lists+linux-ltp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oAKUADAUoGlAfgQAu9opvQ
	(envelope-from <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>)
	for <lists+linux-ltp@lfdr.de>; Thu, 26 Feb 2026 10:36:48 +0100
X-Original-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E65E1A3884
	for <lists+linux-ltp@lfdr.de>; Thu, 26 Feb 2026 10:36:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1772098606; h=mime-version :
 date : message-id : to : references : in-reply-to : subject : list-id
 : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : cc : content-type :
 content-transfer-encoding : sender : from;
 bh=D+IGxOU53IrAPvp6sZmShVGtfYhUystpKOW/1FhsiFc=;
 b=ZiDC4ifE/p3E8JATIuoko6jyyZMc86I+QTqUSuG+C6miON5OzmlE4lBHrJFyv2PVNtjCr
 5++QJqhKNFxbydO1A5lC2R7u65sJpUFGvE8566kVezDOihPl0OPmgqaTqbDsTdcukEfmOFP
 vi/DH2CKGFk6xOGtE0IEJF68ueTGDqY=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 881C03CB5C4
	for <lists+linux-ltp@lfdr.de>; Thu, 26 Feb 2026 10:36:46 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id BF5073C7BA1
 for <ltp@lists.linux.it>; Thu, 26 Feb 2026 10:36:44 +0100 (CET)
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id D9899140098E
 for <ltp@lists.linux.it>; Thu, 26 Feb 2026 10:36:43 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4837f27cf2dso5717385e9.2
 for <ltp@lists.linux.it>; Thu, 26 Feb 2026 01:36:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1772098603; x=1772703403; darn=lists.linux.it;
 h=in-reply-to:references:from:subject:cc:to:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KVp/aA56TrNcejgd3II1XtiZQIobqcnzSVFb2Pcr6Qc=;
 b=VDZIbL+vdlTfvX9+RE4Su6bUKaz+aQKcIQ8FpjomHi5yXl2tKYLNehnxIkqbmZIqDX
 wNh6Odmo9TZpgGDuCVIktb+rbg6aOA+lqJq6KBbXMjT4Z/F6yIsgDROVgR1NakosbJ9Y
 O9aT87uGptujPPNQuBFNMg4D9oEOKne5M0+ljxEDI2+Qmx0B63loDf0Ig/+vaIJUV9h1
 ShL522b3ZH46RDzvbh6Vf9y40PoFsUSn27b7QmSba63eh8R0X9GkT853D4+8Fn9fAA0f
 iUECz4ANO+r8Wgsel/TeTIDhewGamdedbuYeG0oWAoiwtZMB0c0gCcVFvV/nMH1KsyCA
 8GfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772098603; x=1772703403;
 h=in-reply-to:references:from:subject:cc:to:message-id:date
 :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=KVp/aA56TrNcejgd3II1XtiZQIobqcnzSVFb2Pcr6Qc=;
 b=VitTCDn9E3yjlcuDEUKohrq9I2iqRqR4Mj9HfolFqKIko0X0FVvlZ++K9B2EltJtTz
 Y1ioW+o352WalVuOO5AMQfBxBmJ6f+WZZ49OrL/pTu39CuBJ2EBkNWlHbiWI3+wP5Z6h
 yJLcEMhcOoW9NRCKq6ZFzbGF9rFs0QdLH0P1XiCFMU1JlyFT9ncTuXwo/OuWTH9c6N4U
 VNQlwzLQhTGM2hRy3xwZWStYYHTPFBnxvMQi+YIDHr6YWOtZBWKhQDKrWSTcVviDKHuk
 YmE95xj/VMDA3ZIZNIZch+GQ/0J68HQ+DxMMuWqvRDtPnEbkuADZmpaVN+wT5INnphNm
 ZXNw==
X-Gm-Message-State: AOJu0YzPnmpcNdpJHFVuhkZitXSuQQpxmNkaZtEJySD5iDEJqbCqWPIo
 9cMmKC9FoOSU5wqXnnvPlde3f9RiBwTRd6hfSOzoXFjDBaizVkvvoPeKvWmSkwjs7Yk=
X-Gm-Gg: ATEYQzyS3Xma2OTE5UmBgrK35zdFW6g3UlN0NvKL7ES882vjXwDaE4aH3ZG4OFpe/ut
 QUbpENNxOkVbz7Yp0FE9ifDwFYtJq0wrcTSWk/gEmaD3OpNxeWYetiTiGxp1nObdlxXRzFjn8KX
 KkSBX7hDfmqDCwgfzYfxbTQjAMX9nZMy6tjhw84/J/bkC9yYrLP2zYC+r8XLZfBTI4rrpwV7iXY
 3+XsieZVqZI6sxLS7/BUDEugE35SbbjaJc87V7P89+YPVFw1XgKQ4QTHmefIRy1o/FSf6HWAK70
 xhgPSos6eMMRxssohzUivVkdFll8WqH/EHRcQyt2pKtLbACKsorHMHPXq72loQa2AXiVSJNouAQ
 v96JHT75shaxcEybZ8SuRt5zXT6NskrZFHOaHJ4wOUftlxLHAjQYw0DIV4PcqlDo2kzfE0xhKpD
 xv5Bcvy7RX0oMGlkLT3QHtpizh/d1als8PxwnA2fW3Fl8CgeIIfdPjhIBPCfsNeXSBAQZUutdyD
 uxWIATb2KbGXfDI3oV2IXZ0lMSjzw==
X-Received: by 2002:a05:600c:820e:b0:480:1e8f:d15f with SMTP id
 5b1f17b1804b1-483a95eb591mr326365215e9.2.1772098601480; 
 Thu, 26 Feb 2026 01:36:41 -0800 (PST)
Received: from localhost
 (p200300ef2f4fc9009ff26ae1d4042002.dip0.t-ipconnect.de.
 [2003:ef:2f4f:c900:9ff2:6ae1:d404:2002])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483bd750701sm140778035e9.11.2026.02.26.01.36.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Feb 2026 01:36:40 -0800 (PST)
Mime-Version: 1.0
Date: Thu, 26 Feb 2026 10:36:40 +0100
Message-Id: <DGOSIY7VL1R3.1KTK35389TOL3@suse.com>
To: "Cyril Hrubis" <chrubis@suse.cz>, "Wei Gao" <wegao@suse.com>
X-Mailer: aerc 0.18.2
References: <20251125044057.20922-1-wegao@suse.com>
 <20260225015044.19233-1-wegao@suse.com> <aZ7V7XD6LIiZ4m0e@yuki.lan>
 <aZ-jDRXSWK78VmdE@autotest-wegao.qe.prg2.suse.org>
 <aaALdx9zYZDUzs2G@yuki.lan>
In-Reply-To: <aaALdx9zYZDUzs2G@yuki.lan>
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
From: Andrea Cervesato via ltp <ltp@lists.linux.it>
Reply-To: Andrea Cervesato <andrea.cervesato@suse.com>
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[lists.linux.it:s=picard];
	R_SPF_ALLOW(-0.20)[+a:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[lists,linux-ltp=lfdr.de];
	DKIM_MIXED(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DMARC_POLICY_ALLOW(0.00)[lists.linux.it,none];
	DKIM_TRACE(0.00)[lists.linux.it:+,suse.com:-];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-ltp];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[ltp@lists.linux.it,ltp-bounces@lists.linux.it];
	R_DKIM_REJECT(0.00)[suse.com:s=google];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	ASN(0.00)[asn:12779, ipnet:2001:1418::/29, country:IT];
	HAS_REPLYTO(0.00)[andrea.cervesato@suse.com];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[picard.linux.it:helo,picard.linux.it:rdns]
X-Rspamd-Queue-Id: 8E65E1A3884
X-Rspamd-Action: no action

Hi!

On Thu Feb 26, 2026 at 9:59 AM CET, Cyril Hrubis wrote:
> Hi!
> > diff --git a/lib/tst_tmpdir.c b/lib/tst_tmpdir.c
> > index 9b024a74e..0c06a306c 100644
> > --- a/lib/tst_tmpdir.c
> > +++ b/lib/tst_tmpdir.c
> > @@ -186,8 +186,10 @@ static int purge_dirat(int dir_fd, const char *path, char **errptr)
> >                         continue;
> >  
> >                 /* Recursively remove the current entry */
> > -               if (rmobjat(subdir_fd, dir_ent->d_name, errptr) != 0)
> > +               if (rmobjat(subdir_fd, dir_ent->d_name, errptr) != 0) {
> > +                       close(subdir_fd);  <<<<<<<<<< first close
> >                         ret_val = -1;
> > +               }
> >         }
> >         
> >         closedir(dir);  <<<<<<<<<<<<< second close
>
> Ah, right, we hand the fd to the fdopendir() and it's closed in the
> closedir() call. I've missed that since the closedir() is not shown in
> the diff since that part of the code wasn't modified and haven't shown
> up in the diff.
>
> The patch looks good to me then.

Feel free to ack and merge :-)

-- 
Andrea Cervesato
SUSE QE Automation Engineer Linux
andrea.cervesato@suse.com


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
