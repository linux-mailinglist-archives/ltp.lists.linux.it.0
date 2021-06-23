Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 39F8C3B1B39
	for <lists+linux-ltp@lfdr.de>; Wed, 23 Jun 2021 15:34:18 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 022763C6FDA
	for <lists+linux-ltp@lfdr.de>; Wed, 23 Jun 2021 15:34:18 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id C27803C2244
 for <ltp@lists.linux.it>; Wed, 23 Jun 2021 15:34:16 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 9BEE61A001DA
 for <ltp@lists.linux.it>; Wed, 23 Jun 2021 15:34:15 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 1ABC31FD6A;
 Wed, 23 Jun 2021 13:34:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1624455254;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=D/BmHcKqIBjRr8jWZJUj5CpY4ezMTgSpDvYP9e57ToU=;
 b=zAH+GEFfOhy/WQwEVN3jihTKTrFry9FXdTXUem895c7itJRca68oJj+0/r33eVn6+aNbUr
 L0KHCg4R9ET+NcE5uztYYp/RT8r5ucHINdcS4AH0mUiIw2bV9ln2iBwamKpELhGbz790jd
 CnbFyJDlnLKKjADQVHW5nYF1FmObidI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1624455254;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=D/BmHcKqIBjRr8jWZJUj5CpY4ezMTgSpDvYP9e57ToU=;
 b=cHkU594XEQqdf5rPTLMESRknVq8uhrNPhX8PxbhVzk0xR9B1Ryn/W21yIsW7e7tLysLllW
 MAGNqskdN9l5p2AA==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id E77EC11A97;
 Wed, 23 Jun 2021 13:34:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1624455254;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=D/BmHcKqIBjRr8jWZJUj5CpY4ezMTgSpDvYP9e57ToU=;
 b=zAH+GEFfOhy/WQwEVN3jihTKTrFry9FXdTXUem895c7itJRca68oJj+0/r33eVn6+aNbUr
 L0KHCg4R9ET+NcE5uztYYp/RT8r5ucHINdcS4AH0mUiIw2bV9ln2iBwamKpELhGbz790jd
 CnbFyJDlnLKKjADQVHW5nYF1FmObidI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1624455254;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=D/BmHcKqIBjRr8jWZJUj5CpY4ezMTgSpDvYP9e57ToU=;
 b=cHkU594XEQqdf5rPTLMESRknVq8uhrNPhX8PxbhVzk0xR9B1Ryn/W21yIsW7e7tLysLllW
 MAGNqskdN9l5p2AA==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id uvKCNlU402AyQAAALh3uQQ
 (envelope-from <pvorel@suse.cz>); Wed, 23 Jun 2021 13:34:13 +0000
Date: Wed, 23 Jun 2021 15:34:12 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <YNM4VFC0pgygzNJz@pevik>
References: <20210622145938.106477-1-krzysztof.kozlowski@canonical.com>
 <YNL9/k1iRralo/fj@pevik>
 <a7dd74e2-858f-19e4-d2bf-21cb77a3705e@canonical.com>
 <c015b22b-5775-7301-a8b8-13cdd7000fb6@canonical.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c015b22b-5775-7301-a8b8-13cdd7000fb6@canonical.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] controllers/cpuset_hotplug: skip unsupported
 Microsoft Hyper-V
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Krzysztof,

> On 23/06/2021 11:35, Krzysztof Kozlowski wrote:
> > On 23/06/2021 11:25, Petr Vorel wrote:
> >> Hi Krzysztof,

> >>> Microsoft Hyper-V with Linux guests does not support CPU hotplug, even
> >>> if enabled in kernel configuration.  Quoting Ubuntu bug report from
> >>> June 2018: "While Hyper-V may present all potential CPUs via ACPI MADT,
> >>> CPU add/remove is not supported.". [1]

> >> Reviewed-by: Petr Vorel <pvorel@suse.cz>

> >> LGTM. How many of tests will need tst_virt_hyperv? Although we don't touch
> >> legacy API, I'd make an exception and add it to both test.sh and tst_test.sh
> >> (ideally with an API extension, i.e. test could use SKIP_VIRT="hyperv", but that
> >> can wait till tests are converted).

> > Around CPU hotplug that would be the last one I did not spot so far
> > other failures but I also do not track all failures in nice way. Rather
> > fixing them ad-hoc...

> I just checked more and there are additional failures on Azure/HyperV
> with more nodes: cpuset_load_balance, cpuset_memory_pressure,
> cpuset_memory_spread and cpuset_sched_domains. These did not appear on
> smaller instances (e.g. 4 CPUs).

Good to know. Does it mean we should check number of processors?

But even there were just these two and no additional change to
tst_virt_hyperv(), we'd prefer to have them in test.sh and tst_test.sh.
Could you please send v2, where you implement that?

Kind regards,
Petr

> Best regards,
> Krzysztof

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
