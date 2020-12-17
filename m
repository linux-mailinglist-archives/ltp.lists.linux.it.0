Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id DF80D2DCF71
	for <lists+linux-ltp@lfdr.de>; Thu, 17 Dec 2020 11:25:03 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 547023C57C3
	for <lists+linux-ltp@lfdr.de>; Thu, 17 Dec 2020 11:25:03 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 5A5413C2555
 for <ltp@lists.linux.it>; Thu, 17 Dec 2020 11:24:59 +0100 (CET)
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id DA850600D32
 for <ltp@lists.linux.it>; Thu, 17 Dec 2020 11:24:58 +0100 (CET)
Received: by mail-pj1-x1031.google.com with SMTP id iq13so3409264pjb.3
 for <ltp@lists.linux.it>; Thu, 17 Dec 2020 02:24:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=OTgfysbnOPee4QF8d4oKlRIMR975Tsfbbjxf3fLU+fc=;
 b=hCoN866+Lw1jLLeg5PqWIlKcLMk+HOleUEnFOeJKR0gPiwc/OmgXD5TR8nX21PTKOg
 2v2toJNqEHYg7FCTRmQBwbDNFFZMB6jyPb+krr8KwCUkn4PDj+LfFd6A1+zHQj4OmqzE
 YZ8MrEIwB/Xi1cBOBNHGpj3j6btJ7mB5Z/zK7dSSQEPJuQlM3fqxi94hLkkrsJGOYhpO
 OKYDndVGHX/C5dyO3mqoAN9yFk++LFdRZq8Xbjii5gg/l2MmiRKBTDQSUU029i2RaT+W
 CLboqqNvSWWal9Dc0vaBD7mZx7E2S0BGDzfVGs/cWW16RVhe9++wclyMqNpQEGfFTxFV
 0F2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=OTgfysbnOPee4QF8d4oKlRIMR975Tsfbbjxf3fLU+fc=;
 b=C9iy2ZRVMVgFFortcBvDUzUC+lK7GXunOWHQ5BjksZzxkfdWbeC/KVab8XCAgJr5iT
 1AyfnpQGad1yGM31eZSXx6Zfhms4qiLCgmzPLk/U7Q0KuLceqGgBMv1CFBlKX2p/1Txu
 mXkA5Ipqd0rdANUzsSYDXHGYOkNgtvNrSztrNJ0FBitMOsewKOL637iJ2VL8aVNZn0hC
 dnZgI4Uv6iltVN3k5etPQWA8/OJlr7EQbSnng8vkMJ3djmo+xW3SF7X03JWMRzHOcd6l
 bBRhMIhut9fKc5wM5t6wc+BYp9Np/FpysNNZlv3hOl3uHQsj4oXppyJKMhF/TH5tYTHK
 7GFw==
X-Gm-Message-State: AOAM532NtMlXi32BqFzIsaN3rDJXLVbxouNg8WIPV1z7OtpMXMmw4hPc
 Ob0eaEir/s7eQTBfH7gcv0HXyA==
X-Google-Smtp-Source: ABdhPJwLm6N/G6HchV72X4cWJdnN2sW/JueLfD7ZKK3vg9R1B8KMXakHvhDwh0QmyLhW2s9P8v1flA==
X-Received: by 2002:a17:902:b213:b029:db:3a3e:d8ad with SMTP id
 t19-20020a170902b213b02900db3a3ed8admr35799274plr.73.1608200697360; 
 Thu, 17 Dec 2020 02:24:57 -0800 (PST)
Received: from localhost ([122.172.20.109])
 by smtp.gmail.com with ESMTPSA id e29sm5434652pfj.174.2020.12.17.02.24.56
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 17 Dec 2020 02:24:56 -0800 (PST)
Date: Thu, 17 Dec 2020 15:54:54 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20201217102454.4trtcre2cyrcxzdr@vireshk-i7>
References: <b48115a8d6dc3036f08e0166332035fab078b34a.1608189944.git.viresh.kumar@linaro.org>
 <0279beda4660ab1b401164e369c79475633bd067.1608189944.git.viresh.kumar@linaro.org>
 <X9suVu55wgMPiOxC@yuki.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <X9suVu55wgMPiOxC@yuki.lan>
User-Agent: NeoMutt/20180716-391-311a52
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH V2 3/3] syscalls: finit_module: Add tests
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 17-12-20, 11:09, Cyril Hrubis wrote:
> Hi!
> This finit_module02 fails for me:
> 
> tst_test.c:1261: TINFO: Timeout per run is 0h 05m 00s
> finit_module02.c:66: TPASS: finit_module(*tc->fd, tc->param, tc->flags): EINVAL (22)
> finit_module02.c:66: TFAIL: finit_module(*tc->fd, tc->param, tc->flags) expected ENOEXEC: EBADF (9)
> finit_module02.c:66: TPASS: finit_module(*tc->fd, tc->param, tc->flags): EFAULT (14)
> finit_module02.c:66: TPASS: finit_module(*tc->fd, tc->param, tc->flags): EINVAL (22)
> finit_module02.c:66: TPASS: finit_module(*tc->fd, tc->param, tc->flags): EINVAL (22)
> tst_capability.c:29: TINFO: Dropping CAP_SYS_MODULE(16)
> finit_module02.c:66: TPASS: finit_module(*tc->fd, tc->param, tc->flags): EPERM (1)
> tst_capability.c:41: TINFO: Permitting CAP_SYS_MODULE(16)
> finit_module02.c:59: TPASS: finit_module(*tc->fd, tc->param, tc->flags) passed
> finit_module02.c:63: TPASS: finit_module(*tc->fd, tc->param, tc->flags): EEXIST (17)
> finit_module02.c:66: TFAIL: finit_module(*tc->fd, tc->param, tc->flags) expected EBADF: ETXTBSY (26)
> 
> Linux 5.9.12
> 
> Also it looks to me like EBADF is more reasonable error for fd set to -1
> also ETXTBSY sounds more reasonable for a file opened for writing.
> 
> I guess that someone cleaned up the kernel implementation but forget to
> update the manual pages?

Merged in v4.6 and I am on 4.4 :(

commit a1db74209483a24c861c848b4bb79a4d945ef6fa
Author: Mimi Zohar <zohar@linux.vnet.ibm.com>
Date:   Wed Dec 30 07:35:30 2015 -0500

    module: replace copy_module_from_fd with kernel version
    
    Replace copy_module_from_fd() with kernel_read_file_from_fd().
    
    Although none of the upstreamed LSMs define a kernel_module_from_file
    hook, IMA is called, based on policy, to prevent unsigned kernel modules
    from being loaded by the original kernel module syscall and to
    measure/appraise signed kernel modules.
    
    The security function security_kernel_module_from_file() was called prior
    to reading a kernel module.  Preventing unsigned kernel modules from being
    loaded by the original kernel module syscall remains on the pre-read
    kernel_read_file() security hook.  Instead of reading the kernel module
    twice, once for measuring/appraising and again for loading the kernel
    module, the signature validation is moved to the kernel_post_read_file()
    security hook.
    
    This patch removes the security_kernel_module_from_file() hook and security
    call.
    
    Signed-off-by: Mimi Zohar <zohar@linux.vnet.ibm.com>
    Acked-by: Kees Cook <keescook@chromium.org>
    Acked-by: Luis R. Rodriguez <mcgrof@kernel.org>
    Cc: Rusty Russell <rusty@rustcorp.com.au>

-- 
viresh

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
