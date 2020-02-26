Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E05116F7FA
	for <lists+linux-ltp@lfdr.de>; Wed, 26 Feb 2020 07:28:46 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E06473C251E
	for <lists+linux-ltp@lfdr.de>; Wed, 26 Feb 2020 07:28:45 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 7D35A3C08C9
 for <ltp@lists.linux.it>; Wed, 26 Feb 2020 07:28:42 +0100 (CET)
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 369911400DA6
 for <ltp@lists.linux.it>; Wed, 26 Feb 2020 07:28:42 +0100 (CET)
Received: by mail-pf1-x442.google.com with SMTP id i6so935210pfc.1
 for <ltp@lists.linux.it>; Tue, 25 Feb 2020 22:28:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=qIBGMr+XjXOdTKYDyndK1VoAH887FXUSyc03B8qFSAw=;
 b=c4NXnaSywTz2gWiEUw04YCc+WD58R6lT2jkxAmJ+7X0MnlvNCfqYcMeFrezYCMDeuo
 +h2VC9QT+DrRNh0LhFQS21xsaZ6s0Uqs6zAw/KYzZsfniq/ncECixZaGWMKAk9G9ltOz
 DiTlDUtfnoa6Y8IF1syqOoyi2Oa2E5kB29J0Y1WBcIVRzoa+ND0QVVrHIIetiwBP68fP
 Zs32kKLeunhmVzdMazWmiwJfGYp8cSK5yPmCAXaP4ggJgfjdU5eacHGEvklFmDXpTBms
 JzoXULnXEbpH7/ty2/5IBiO8vcL9rMgVyZYfY+4DcAPi/3xFn89Glo/CLnYBDS+HfNV0
 BhDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=qIBGMr+XjXOdTKYDyndK1VoAH887FXUSyc03B8qFSAw=;
 b=d5HbRu85jiZCIAfg38qWrE46xZwH6K7avdpQQazvad7gfICCaTENYeZOLrASxmLkOv
 GKOdLMeF85wFHpdIZtxmXSabP9LeR5LOxqsGxC/5nOIgRe/yBeT7+uci/RH5RQxBWUoS
 oQoP9BG1Hqw/ytd8pBjjhqIpNrMmqiQWEuCiCy7boXTdgatfc1wZBGnLnN9KwaAu5/Aq
 REA/u5t69+BYYwR5PUqv9qghW7Mj+X6UIDLL2ManWNAnGsHB4WQDRkFxBlboJ7ObhAYk
 zj6TIUGO96sL0g26RaGOGklPVO8Gl08HhCpxXomlx9X73FCgnZbAVQba4UqC7kxaX2uk
 FCSw==
X-Gm-Message-State: APjAAAU5T9tGzZsldJaiLuDABNh/m6+b27j9pZwzkZdXqmdVLtWn+W66
 5/SRJaqMs0ETV9L7qfjd+IFklkTc7B0=
X-Google-Smtp-Source: APXvYqyX8bBae45+LuyFDJAkVAGFSKMOUTQF0+87wuGPCsHtOcm1sKvG8Bc3/v1C7RBwRHveYD5l3Q==
X-Received: by 2002:a63:2023:: with SMTP id g35mr555013pgg.100.1582698520112; 
 Tue, 25 Feb 2020 22:28:40 -0800 (PST)
Received: from localhost ([223.226.55.170])
 by smtp.gmail.com with ESMTPSA id y3sm1315603pff.52.2020.02.25.22.28.38
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 25 Feb 2020 22:28:39 -0800 (PST)
Date: Wed, 26 Feb 2020 11:58:37 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it, Vincent Guittot <vincent.guittot@linaro.org>,
 anmar.oueja@linaro.org, Cyril Hrubis <chrubis@suse.cz>,
 Vikas.Kumar2@arm.com, Li Wang <liwang@redhat.com>,
 Petr Vorel <pvorel@suse.cz>
Message-ID: <20200226062837.v3bfggksn62dk2gt@vireshk-i7>
References: <7c0899c42b8d8434c1cf9ca6b261993a1c09031f.1582612624.git.viresh.kumar@linaro.org>
 <305330ad290ce4802d832e02765b8723a976d4a7.1582627066.git.viresh.kumar@linaro.org>
 <20200226051407.GP14282@dhcp-12-102.nay.redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200226051407.GP14282@dhcp-12-102.nay.redhat.com>
User-Agent: NeoMutt/20180716-391-311a52
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH V4 1/10] tst_device: Add tst_is_mounted() helper
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 26-02-20, 13:14, Zorro Lang wrote:
> For example, if path is "/mnt/test", and we get a line as "/mnt/test/mnt1 ..."
> or "/mnt/mnt/test", Then this function thinks "/mnt/test" is a mountpoint.
> 
> We can refer to util-linux/sys-utils/mountpoint.c a little, but it's complicated,
> or we can call mountpoint command directly?

This is working fine for me, does this looks okay now ?

diff --git a/lib/tst_device.c b/lib/tst_device.c
index d99fb8bc554a..8bf6dacf5973 100644
--- a/lib/tst_device.c
+++ b/lib/tst_device.c
@@ -388,25 +388,16 @@ int tst_umount(const char *path)
 
 int tst_is_mounted(const char *path)
 {
-       char line[256];
-       FILE *file;
-       int ret = 0;
-
-       file = SAFE_FOPEN(NULL, "/proc/mounts", "r");
-
-       while (fgets(line, sizeof(line), file)) {
-               if (strstr(line, path) != NULL) {
-                       ret = 1;
-                       break;
-               }
-       }
+       char cmd[PATH_MAX];
+       int ret;
 
-       SAFE_FCLOSE(NULL, file);
+       snprintf(cmd, sizeof(cmd), "mountpoint -q %s", path);
+       ret = tst_system(cmd);
 
-       if (!ret)
+       if (ret)
                tst_resm(TINFO, "No device is mounted at %s", path);
 
-       return ret;
+       return !ret;
 }

-- 
viresh

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
