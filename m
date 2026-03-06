Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
Delivered-To: lists+linux-ltp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KFN5KeNCqmkHOQEAu9opvQ
	(envelope-from <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>)
	for <lists+linux-ltp@lfdr.de>; Fri, 06 Mar 2026 03:58:43 +0100
X-Original-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BD2021AD00
	for <lists+linux-ltp@lfdr.de>; Fri, 06 Mar 2026 03:58:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1772765922; h=date : to :
 message-id : references : mime-version : in-reply-to : subject :
 list-id : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : cc : content-type :
 content-transfer-encoding : sender : from;
 bh=bRGZWxu3ZkAcMd+IAl0fVw3dc8UzIegLrPv8fK4p7L8=;
 b=POKvNLgsRSqOMraHSPke+yy6oRNZ7MVDOWa0Et3dm8NS83DPC+6NTnXUsgHGMEDpssVcG
 rpTosqf4YblHF+aka/sWv0I/LdrFIcgxCBOjeR+dGZ3S6TaUFGSx8YoHlhLpIzskys+7ckc
 wyMSoc+LD2hD7sfaWcl2yq+GC/8g5gQ=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 531343DD13C
	for <lists+linux-ltp@lfdr.de>; Fri,  6 Mar 2026 03:58:42 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 4C0173C67EE
 for <ltp@lists.linux.it>; Fri,  6 Mar 2026 03:58:37 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id E4F4B1400E57
 for <ltp@lists.linux.it>; Fri,  6 Mar 2026 03:58:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1772765914;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QHys10WryeCAdNRHE1aImPIA64j6h/qyvrvUUpU0BDc=;
 b=aZqOUoEE/IopFBJN9nWwvuxWRXaPuKC9MWYyE8/YJ8HgBzpQUjeL0/nEIyf/CvlMulOqIW
 88GmXvDId3RvPVWBCN7dTPBt5POd60x0rlOGttOapdDS4XQHsv7m9/pluFM9ux93WXQ9cT
 dHTBYtX9km03tAcszXeCu2c0wtLAcIE=
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-518-x14pMytCNlyGPkAGXi2GaA-1; Thu, 05 Mar 2026 21:58:33 -0500
X-MC-Unique: x14pMytCNlyGPkAGXi2GaA-1
X-Mimecast-MFC-AGG-ID: x14pMytCNlyGPkAGXi2GaA_1772765912
Received: by mail-pg1-f197.google.com with SMTP id
 41be03b00d2f7-c738f71723aso823484a12.2
 for <ltp@lists.linux.it>; Thu, 05 Mar 2026 18:58:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772765912; x=1773370712;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QHys10WryeCAdNRHE1aImPIA64j6h/qyvrvUUpU0BDc=;
 b=Mm2EzaVbbNfXZ6J+dRP0j1Ty2W+P5slDOCs4XMJcrdV9u6o3dlTn7337kAxaDyDXng
 yAIvlxWdaXGc48Y7IBnj3QibIEy0FM00tV81Q1bTLHUFC88HOzBJsB2M8FuU/hTkpxHX
 uwwSAW2sfZIce5PXHNblnnxLUkOxl9ZwqXUc3+IobdA/HvnNmWxrUY2fIbSlnzDHZ2I/
 noRy38N3vC+7gFiyWzO4M6CxM/ZyNFGm1xTm19G12tFZL6Qhh99KZ8fHH83VuDufRLV4
 70VldQ2asgAlmmAMJQ7bquIwiP1uYRxBCTr0Plr938cj5STG9mgP7FKw/BHpAj1bgJSP
 egcg==
X-Gm-Message-State: AOJu0YzI7OjG3QOT0PvW6uVzhD2a5w6h8HtnVaT+PvEvuTv8G4QJHnoh
 YCKU01mZKEx3uk89vQFaCNL4+o7J1NfvRjoFOkYg0908pd5xcfnFapYp5jwzvm/wKl4DbhLgA1j
 v5PiTxhyYy2Kwnb8sjSDcTbteGYHKtFTiGNjDHOY8XvUWgvz7/WC3
X-Gm-Gg: ATEYQzzxDF4BBqB4HpH4vEvVuDdOn8d7rdt/AqYiwsTWNy/zMntJN5K2+CNQDcp8kq7
 6dOnW47MpdCWqIeu9fcihWAIVENGVxSbvhNc2mseGfS/d6ZPdeHG44RNmX41fbnw/FgTBSn28td
 craAYkOVkZK+QFufLebH0fhxM9079k+VYGZvHm6Jw2cnz6mwjsKAdJvRjS2PHEPHC3tafk41Fo1
 llzHmXQ5VULN1O7pg/U3fnZmWMUfDQD27Ka3+uIcv3jrHg+YocenDrC/yWKayf3Yn5CWTIt1tS4
 qcRtijD8pLmDEDl2l3uialMqgVOovGkEuRTrMbMeUdG8gZEknpIlplocNjsVuNPoOuVCmPdPtiB
 YhA5Z33V/ZbYqY/7r
X-Received: by 2002:a05:6a20:d80c:b0:350:d523:80a4 with SMTP id
 adf61e73a8af0-39858fed2f6mr781174637.28.1772765911986; 
 Thu, 05 Mar 2026 18:58:31 -0800 (PST)
X-Received: by 2002:a05:6a20:d80c:b0:350:d523:80a4 with SMTP id
 adf61e73a8af0-39858fed2f6mr781160637.28.1772765911571; 
 Thu, 05 Mar 2026 18:58:31 -0800 (PST)
Received: from redhat.com ([209.132.188.88]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c739e183020sm77426a12.26.2026.03.05.18.58.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Mar 2026 18:58:30 -0800 (PST)
Date: Fri, 6 Mar 2026 10:58:29 +0800
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <aapC1ZHA_XopT50y@redhat.com>
References: <20260304161425.12461-1-chrubis@suse.cz>
 <aajhsZYkb9WqTho2@redhat.com> <aamSaHica1WmVDIT@yuki.lan>
MIME-Version: 1.0
In-Reply-To: <aamSaHica1WmVDIT@yuki.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: vNqrH3DQwMX3EWNg1qtircdUk2mrIuOh-cy7URO9VXk_1772765912
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-6.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH] syscalls: newuname01: Convert to the new library.
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
From: Li Wang via ltp <ltp@lists.linux.it>
Reply-To: Li Wang <liwang@redhat.com>
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Rspamd-Queue-Id: 3BD2021AD00
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.21 / 15.00];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_SPF_ALLOW(-0.20)[+a];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.linux.it:s=picard];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[lists,linux-ltp=lfdr.de];
	DMARC_POLICY_ALLOW(0.00)[lists.linux.it,none];
	DKIM_MIXED(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	TO_DN_SOME(0.00)[];
	R_DKIM_REJECT(0.00)[redhat.com:s=mimecast20190719];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	DKIM_TRACE(0.00)[lists.linux.it:+,redhat.com:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[ltp@lists.linux.it,ltp-bounces@lists.linux.it];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	TAGGED_RCPT(0.00)[linux-ltp];
	ASN(0.00)[asn:12779, ipnet:2001:1418::/29, country:IT];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	HAS_REPLYTO(0.00)[liwang@redhat.com]
X-Rspamd-Action: no action

On Thu, Mar 05, 2026 at 03:25:44PM +0100, Cyril Hrubis wrote:
> Hi!1
> > > +	SAFE_FILE_SCANF("/proc/sys/kernel/hostname", "%1023[^\n]", proc_val);
> > > +	TST_EXP_EQ_STR(name->nodename, proc_val);
> > >  
> > > -	tst_parse_opts(ac, av, NULL, NULL);
> > > +	SAFE_FILE_SCANF("/proc/sys/kernel/osrelease", "%1023[^\n]", proc_val);
> > > +	TST_EXP_EQ_STR(name->release, proc_val);
> > >  
> > > -	setup();
> > > +	SAFE_FILE_SCANF("/proc/sys/kernel/version", "%1023[^\n]", proc_val);
> > > +	TST_EXP_EQ_STR(name->version, proc_val);
> > 
> > We'd better clear proc_val between reads:
> > 
> >   proc_val[0] = '\0';
> 
> I'm looking at safe_file_scanf() code and it calls tst_brkm_() in any
> case that no conversion was done. So the buffer should be either be
> filled with new data or the test should exit with an error. Do I miss
> something?

You're right, I somehow overlooked the SAFE_ macro, which will cause an
error if the read fails. Please ignore this comment.

-- 
Regards,
Li Wang


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
