Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 159B53D55B8
	for <lists+linux-ltp@lfdr.de>; Mon, 26 Jul 2021 10:37:01 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8EF943C815C
	for <lists+linux-ltp@lfdr.de>; Mon, 26 Jul 2021 10:37:00 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 4F8CA3C65B1
 for <ltp@lists.linux.it>; Mon, 26 Jul 2021 10:36:56 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 146CB1000938
 for <ltp@lists.linux.it>; Mon, 26 Jul 2021 10:36:54 +0200 (CEST)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id CE9381FE53;
 Mon, 26 Jul 2021 08:36:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1627288613;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=riScUwcn+T1SZJNRYdHSS9tDaQsSVn9h3wEgIxEsHK4=;
 b=c0vw084JAkl5k98Z2quslsx4OJi4ucr6cPbvu9cIRkaFXQQli6zUFSrbdn2CYJV497fHg7
 fni6XEyWSY9IFu3qwNbg3KT+nTN1yn9Vu0bO1dHjZS18JFQRyY3nRy1VuiBhPVD85jNuti
 GGZBUmcLAwZxP17LWh8Z1SL6NDGZGh4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1627288613;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=riScUwcn+T1SZJNRYdHSS9tDaQsSVn9h3wEgIxEsHK4=;
 b=gwFz1CLfHZuzkznnxDM56fhMpzQtWgpGg0HhqjnKaxwXmoxbQ94/YkWOUr/1A8m0/9Hrcx
 8CGAhYvxM8rz6yBw==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 96E6B1365C;
 Mon, 26 Jul 2021 08:36:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id 1mC2IiV0/mDDIQAAGKfGzw
 (envelope-from <pvorel@suse.cz>); Mon, 26 Jul 2021 08:36:53 +0000
Date: Mon, 26 Jul 2021 10:36:51 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <YP50I9N3dfASNrvz@pevik>
References: <20210401125127.45600-1-wangxin410@huawei.com>
 <YNoxKg+Hm0qa3Z70@pevik>
 <fd26cf45-7dd8-004f-3d41-422ce4d9bbdb@canonical.com>
 <34bbe196-515c-f4f3-6d1c-5c9f1221e52a@canonical.com>
 <ca6ecb17-c1b4-0d8a-a3c4-dc5e8e2bd275@canonical.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ca6ecb17-c1b4-0d8a-a3c4-dc5e8e2bd275@canonical.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] ltp_tpci.c: Add release operation before
 allocation
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
Cc: Wang Xin <wangxin410@huawei.com>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi all,

> On 07/07/2021 09:04, Krzysztof Kozlowski wrote:
> > On 29/06/2021 11:38, Krzysztof Kozlowski wrote:
> >> On 28/06/2021 22:29, Petr Vorel wrote:
> >>> Hi Xin,

> >>>> When we run the test case, the following results will be obtained:
> >>>> test_pci  283  TPASS  :  PCI bus 7d slot 00 : Test-case '11'
> >>>> test_pci  284  TFAIL  :  tpci.c:74: PCI bus 7d slot 00 : Test-case '12'
> >>>> ...
> >>>> test_pci  300  TFAIL  :  tpci.c:74: PCI bus 7d slot 01 : Test-case '12'
> >>>> test_pci  301  TPASS  :  PCI bus 7d slot 01 : Test-case '13'

> >>>> The analysis is that the space allocated by the bios is insufficient.
> >>>> The solution to this problem can be in add pci_release_resource(dev, i)
> >>>> before system resources are reallocated.Because the resources have been
> >>>> allocated when the system is initialized.If it is redistributed, it
> >>>> should be released and then allocated.

> >>> I wonder if this is the same issue as the one described by Krzysztof in his
> >>> patch:
> >>> https://patchwork.ozlabs.org/project/ltp/patch/20210401125127.45600-1-wangxin410@huawei.com/

> >>> Could you please share what HW and kernel you use and post dmesg?

> >> This solves my problem. It seems that could be the root cause - early
> >> configuration allocated too small resource? It might be also some
> >> specific BIOS issue (wrong resource allocated?) because in case of
> >> resource assignment failure, the kernel should try to get the original
> >> FW address from BIOS (pcibios_retrieve_fw_addr()) and this apparently
> >> returns NULL translated to -ENOMEM.

> >> I am fine with going with this patch instead of mine.


> > Is there anything stopping Xin's patch from being applied? LGTM:
Lack of time :)

> > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

Reviewed-by: Petr Vorel <pvorel@suse.cz>

> Oh, I see what's wrong with the patch - it's corrupted, not possible to
> apply.

Trivial fix, I'll merge it shortly.

Kind regards,
Petr

> Best regards,
> Krzysztof

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
