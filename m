Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id E2F0B2C6380
	for <lists+linux-ltp@lfdr.de>; Fri, 27 Nov 2020 11:59:33 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 567863C4E17
	for <lists+linux-ltp@lfdr.de>; Fri, 27 Nov 2020 11:59:33 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 6013A3C2CBF
 for <ltp@lists.linux.it>; Fri, 27 Nov 2020 11:59:30 +0100 (CET)
Received: from mail.avm.de (mail.avm.de [212.42.244.119])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id A829E600298
 for <ltp@lists.linux.it>; Fri, 27 Nov 2020 11:59:29 +0100 (CET)
Received: from mail-notes.avm.de (mail-notes.avm.de [172.16.0.1])
 by mail.avm.de (Postfix) with ESMTP;
 Fri, 27 Nov 2020 11:58:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=avm.de; s=mail;
 t=1606474737; bh=km0Lsk7WckbRfthaUPoTLMDR8o2AYWtLDvzrkoN1Gjg=;
 h=In-Reply-To:References:Subject:From:To:Cc:Date:From;
 b=nKMNOAh5zZtLf7f1WhfJGqt/A5wjTsqoIimRJXw80f9StBG+wn5//1P7RXPYK42Jr
 36yafd/+U9AkHA7N6THbBXsKFTTjhcfkUks2Iq0fsW+JuCeAyM+/p/6YGqQ9p8De6F
 C6NSDnwY1yXcpT62F3VUjb9ETIK2KpsuBeNDgoik=
MIME-Version: 1.0
X-Disclaimed: 1
Sensitivity: 
Importance: Normal
X-Priority: 3 (Normal)
In-Reply-To: <9c761b66-89c6-9121-88bb-44e98b9a64cb@oracle.com>
References: <9c761b66-89c6-9121-88bb-44e98b9a64cb@oracle.com>,
 <edf96c93-8f16-6545-629a-be727d4c8eb2@oracle.com>
 <OFCE604BCE.4F62924B-ONC125862B.004801C0-C125862B.0048027B@avm.de>
 <OF47EE0279.8BED1D35-ONC125862C.0051B56D-C125862C.0051B570@avm.de>
To: "Alexey Kodanev" <alexey.kodanev@oracle.com>
Date: Fri, 27 Nov 2020 11:58:57 +0100
Message-ID: <OF67F47D3A.085506A0-ONC125862D.003BE9A0-C125862D.003C5457@avm.de>
X-Mailer: Lotus Domino Web Server Release 11.0.1FP1 July 20, 2020
X-MIMETrack: Serialize by http on ANIS1/AVM(Release 11.0.1FP1|July 20, 2020) at
 27.11.2020 11:58:57, Serialize complete at 27.11.2020 11:58:57,
 Serialize by Router on ANIS1/AVM(Release 11.0.1FP1|July 20, 2020) at
 27.11.2020 11:58:57
X-purgate-ID: 149429::1606474737-00000599-35C4752B/0/0
X-purgate-type: clean
X-purgate-size: 880
X-purgate-Ad: Categorized by eleven eXpurgate (R) http://www.eleven.de
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate: clean
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] netstress: explicitly set a thread stack size
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
From: Johannes Nixdorf via ltp <ltp@lists.linux.it>
Reply-To: j.nixdorf@avm.de
Cc: LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

-----"Alexey Kodanev" <alexey.kodanev@oracle.com> wrote: -----
>On 26.11.2020 17:52, Johannes Nixdorf via ltp wrote:
>It doesn't mean you should intentionally pass unaligned size.
>
>And on it's man-page [1], in errors section, there is a note that it
>might
>return EINVAL for some systems if the stack size not multiple of page
>size.

Ok. I was going by the POSIX man page [1], which doesn't mention
that practice.

[1]: https://pubs.opengroup.org/onlinepubs/9699919799/functions/pthread_attr_setstacksize.html

>max_msg_len is const.

It seems like I was misreading [2] to mean it sets max_msg_len
instead of using it as a limit.

[2]: https://github.com/linux-test-project/ltp/blob/master/testcases/network/netstress/netstress.c#L854

Thanks for the review, I'll change it to go with your proposed
static limit.

Regards,
Johannes

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
