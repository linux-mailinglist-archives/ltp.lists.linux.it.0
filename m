Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
Delivered-To: lists+linux-ltp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YHNqAyp3e2mMEgIAu9opvQ
	(envelope-from <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>)
	for <lists+linux-ltp@lfdr.de>; Thu, 29 Jan 2026 16:05:14 +0100
X-Original-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A0A2B1477
	for <lists+linux-ltp@lfdr.de>; Thu, 29 Jan 2026 16:05:13 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3F6563CC2E6
	for <lists+linux-ltp@lfdr.de>; Thu, 29 Jan 2026 16:05:13 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 3440B3CC218
 for <ltp@lists.linux.it>; Thu, 29 Jan 2026 16:05:10 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id AD7B0200B3E
 for <ltp@lists.linux.it>; Thu, 29 Jan 2026 16:05:09 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 896C934170;
 Thu, 29 Jan 2026 15:05:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1769699108; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DJSG1GmP1TPg7O0H4zeY1/1f/4nbWJZG1LKd5M3zYGk=;
 b=spLeXGFBPzj9Tq8wX8kbA9ADszjUk6HHeFeL7P92cEZkjacKpVUz0qDHgmMIR+WmtPTq52
 OgHYjDYX7i4ZhTtL15rqyslYUBmG3m/ZOxwl9zq80PrE+R8A90Vd4mfnNzSqsimW5rZXSu
 hEV2h43hFGXIgdkUozArdRvqk7DzU3s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1769699108;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DJSG1GmP1TPg7O0H4zeY1/1f/4nbWJZG1LKd5M3zYGk=;
 b=2nXkCx/WkMtY8kPyyo9fBEKgGLHIjd1nSu492z7eABc+HsYBUYRwoD/lsT8St3GuQZ1Iv2
 XM4a3e63CWgQSGCA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1769699108; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DJSG1GmP1TPg7O0H4zeY1/1f/4nbWJZG1LKd5M3zYGk=;
 b=spLeXGFBPzj9Tq8wX8kbA9ADszjUk6HHeFeL7P92cEZkjacKpVUz0qDHgmMIR+WmtPTq52
 OgHYjDYX7i4ZhTtL15rqyslYUBmG3m/ZOxwl9zq80PrE+R8A90Vd4mfnNzSqsimW5rZXSu
 hEV2h43hFGXIgdkUozArdRvqk7DzU3s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1769699108;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DJSG1GmP1TPg7O0H4zeY1/1f/4nbWJZG1LKd5M3zYGk=;
 b=2nXkCx/WkMtY8kPyyo9fBEKgGLHIjd1nSu492z7eABc+HsYBUYRwoD/lsT8St3GuQZ1Iv2
 XM4a3e63CWgQSGCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5450F3EA61;
 Thu, 29 Jan 2026 15:05:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id LQAMEyR3e2n6GAAAD6G6ig
 (envelope-from <chrubis@suse.cz>); Thu, 29 Jan 2026 15:05:08 +0000
Date: Thu, 29 Jan 2026 16:06:24 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Jan Stancek <jstancek@redhat.com>
Message-ID: <aXt3cKet0G4d0oF0@yuki.lan>
References: <DEYWYH3VLMDA.R2SSTA8T80LU@suse.com>
 <20251215161353.GA282302@pevik>
 <DEYXGZU8IXPQ.2N0IS65HUZ0LI@suse.com>
 <20251215165247.GC282302@pevik>
 <DF171554SNRA.2CKR0Q3FLG2TU@suse.com>
 <CABeuJB2TJ4bQDX709-sLO0tb0acYH770kS6X5zXMh0V0M3Yt-w@mail.gmail.com>
 <aV6DCbns02E4BCTj@yuki.lan> <20260107160656.GB791855@pevik>
 <aV6G0gxYWHSFkls0@yuki.lan>
 <CAASaF6wOSvi+07Pq5O6+f1Hkrq6WWMgpCaooJxWrO9uOvRM3pw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAASaF6wOSvi+07Pq5O6+f1Hkrq6WWMgpCaooJxWrO9uOvRM3pw@mail.gmail.com>
X-Spam-Score: -4.30
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-7.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH] ioctl_pidfd02-06: Add CONFIG_USER_NS and
 CONFIG_PID_NS to needs_kconfigs
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
Cc: ltp@lists.linux.it, Terry Tritton <terry.tritton@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.49 / 15.00];
	R_DKIM_REJECT(1.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+a:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[lists,linux-ltp=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[suse.cz:-];
	DMARC_NA(0.00)[suse.cz];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[chrubis@suse.cz,ltp-bounces@lists.linux.it];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-ltp];
	ASN(0.00)[asn:12779, ipnet:2001:1418::/29, country:IT];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.it:url,yuki.lan:mid,picard.linux.it:helo,picard.linux.it:rdns]
X-Rspamd-Queue-Id: 9A0A2B1477
X-Rspamd-Action: no action

Hi!
> > > Because that was my question - really always prefer kconfig even there is a
> > > simple runtime solution? I'd like to have some "rule" like conclusion we can
> > > point during review.
> >
> > I think that from a long term view this is going to be simpler solution
> > than having many different types of checks. The less diverse these
> > checks are the easier they are to review and maintain. Hence I lean
> > towards kernel config checks even though they are slower (mostly
> > unmeasurable on today's harware) than the alternatives.
> 
> I think I lean opposite way, and rather have a check for right
> environment to support the test.
> You can have feature X enabled in kernel config, but still disabled
> later at boot/runtime
> (e.g. max_user_namespaces=0), or a module simply not being loaded.

That is a good catch.

Maybe the best way forward would be to add hooks for certain config
options into the LTP kernel config parser that would do additional
runtime checks. That way we would have both the information on which
kernel configs should be enabled in test metadata as well as runtime
checks.

What about eventually adding something as:

diff --git a/lib/tst_kconfig.c b/lib/tst_kconfig.c
index 9bcd57721..f6abe6cc7 100644
--- a/lib/tst_kconfig.c
+++ b/lib/tst_kconfig.c
@@ -110,6 +110,18 @@ static void close_kconfig(FILE *fp)
                fclose(fp);
 }

+static void runtime_check(struct tst_kconfig_var *var)
+{
+       if (strstr(var->id, "CONFIG_USER_NS")) {
+               if (!tst_user_ns_enabled()) {
+                       tst_res(TINFO, "CONFIG_USER_NS present but runtime is disabled");
+                       var->val = 'n';
+               }
+       } else if (...)
+               ...
+       }
+}
+
 static inline int kconfig_parse_line(const char *line,
                                      struct tst_kconfig_var *vars,
                                      unsigned int vars_len)
@@ -183,9 +195,11 @@ out:
                        switch (val[0]) {
                        case 'y':
                                vars[i].choice = 'y';
+                               runtime_check(&vars[i]);
                                return 1;
                        case 'm':
                                vars[i].choice = 'm';
+                               runtime_check(&vars[i]);
                                return 1;
                        }
                }


-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
